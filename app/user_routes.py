from flask import render_template, request, redirect, url_for, jsonify, Blueprint
from flask import session
from app import app
from app.db import get_db_connection
from werkzeug.security import generate_password_hash, check_password_hash
from mysql.connector import IntegrityError

@app.route('/users', methods=['GET'])
def get_users():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(users)

@app.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)
    cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
    user = cursor.fetchone()
    cursor.close()
    connection.close()

    if user:
        return jsonify(user)
    else:
        return jsonify({'error' : 'User not found'}), 404
    
@app.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    try:
        connection = get_db_connection()
        cursor = connection.cursor()

        # Check if the user exists
        cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
        user = cursor.fetchone()

        if not user:
            cursor.close()
            connection.close()
            return jsonify({'error': 'User not found'}), 404

        # Delete the user
        cursor.execute("DELETE FROM users WHERE id = %s", (user_id,))
        connection.commit()
        cursor.close()
        connection.close()

        return jsonify({'message': f'User {user_id} deleted successfully'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    mot_de_passe = data.get('mot_de_passe')

    if not all([email, mot_de_passe]):
        return jsonify({'error' : 'Missing required fields'}), 400
    
    try:

        connection = get_db_connection()
        cursor = connection.cursor(dictionary = True)
        cursor.execute("""
            SELECT * FROM users WHERE email = %s
            """, (email,))
        
        user = cursor.fetchone()
        cursor.close()
        connection.close()

        if not user:
            return jsonify({'error': "Invalid email or password"}), 401

        if check_password_hash(user['mot_de_passe'], mot_de_passe):
            session['user_id'] = user['id']
            session['username'] = user['username']
            session['email'] = user['email']
            session['tel'] = user['tel']
            session['date_naissance'] = str(user['date_naissance'])
            session['role'] = user['role'] 
            
            return jsonify({
                'email': user['email'],
                'username': user['username'],
                'id': user['id']
            }), 200
        else:
            return jsonify({'error' : "Invalid password or email"}), 401
        


    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/signup', methods=['POST'])
def sign_up():
    data = request.get_json() #Json du formulaire d'entree
    username = data.get('username')
    email = data.get('email')
    tel = data.get('tel')
    date_naissance = data.get('date_naissance')
    mot_de_passe = data.get('mot_de_passe')
    role = data.get('role')

    if not all([username, email, mot_de_passe, tel, date_naissance, role]):
        return jsonify({'error': 'Missing required fields'}), 400
    
    try: 
        hashed_password = generate_password_hash(mot_de_passe)

        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO users (username, email, tel, date_naissance, mot_de_passe, role)
            VALUES(%s, %s, %s, %s, %s, %s)        
        """, (username, email, tel, date_naissance, hashed_password, role))
        
        user_id = cursor.lastrowid
        
        connection.commit()
        cursor.close()
        connection.close()

        return jsonify({
            'id' : user_id,
            'username' : username,
            'email': email
        }), 201
    
    except IntegrityError as e:

        if "username" in str(e).lower():
            return jsonify({'error': 'Username already in use'}), 409
        elif "email" in str(e).lower():
            return jsonify({'error': 'Email already in use'}), 409
        else:
            return jsonify({'error': 'Database error'}), 500

    except Exception as e:
        return jsonify({'error': str(e)}), 500

