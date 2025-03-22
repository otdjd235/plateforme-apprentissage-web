from flask import render_template, request, redirect, url_for, jsonify, Blueprint
from app import app
from app.db import get_db_connection
from werkzeug.security import generate_password_hash
from mysql.connector import IntegrityError

@app.route('/users', methods=['GET'])
def get_users():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    cursor.close
    connection.close
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
    
@app.route('/signup', methods=['POST'])
def sign_up():
    data = request.get_json() #Json du formulaire d'entree
    username = data.get('username')
    email = data.get('email')
    tel = data.get('tel')
    date_naissance = data.get('date_naissance')
    mot_de_passe = data.get('mot_de_passe')
    role = data.get('role')

    if not all([username, email, mot_de_passe, tel, date_naissance]):
        return jsonify
    
    try: 
        hashed_password = generate_password_hash(mot_de_passe)

        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO users (username, email, tel, date_naissance, mot_de_passe, role)
            VALUES(%s, %s, %s, %s, %s, %s)        
        """, (username, email, tel, date_naissance, hashed_password, role))

        connection.commit()
        cursor.close()
        connection.close()

        user_id = cursor.lastrowid
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
