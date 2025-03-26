from flask import render_template, request, redirect, url_for, jsonify, Blueprint
from flask import session
from app import app
from app.db import get_db_connection
from werkzeug.security import generate_password_hash, check_password_hash
from mysql.connector import IntegrityError

@app.route('/api/cours', methods=['GET'])
def get_cours():
    page = int(request.args.get('page', 1))
    cours_per_page = int(request.args.get('cours_per_page', 10))
    
    offset = (page - 1) * cours_per_page #Indique a quel item commencer pour les afficher

    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)

    cursor.execute(" SELECT * FROM cours LIMIT %s OFFSET %s", (cours_per_page, offset))
    cours = cursor.fetchall()

    cursor.execute("SELECT COUNT(*) as total from cours")
    total = cursor.fetchone()['total']

    cursor.close()
    connection.close()

    return jsonify({
        'page': page,
        'cours_per_page' : cours_per_page,
        'cours_total' : total,
        'data' : cours
    }), 200

@app.route('/cours/<int:cours_id>/chapitres', methods=['GET'])
def get_cours_chapitres(cours_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)

    cursor.execute("SELECT * FROM cours WHERE id_cours = %s", (cours_id,))
    cours = cursor.fetchone()

    if not cours:
        cursor.close()
        connection.close()
        return jsonify({'error' : 'Cours not found'}), 404

    cursor.execute("SELECT * FROM chapitres WHERE id_cours = %s ORDER BY ordre ASC", (cours_id,))

    chapitres = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(chapitres)

@app.route('/chapitres/<int:chapitre_id>/video', methods=['GET'])
def get_chapitres_video(chapitre_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)

    cursor.execute("SELECT * FROM chapitres WHERE id_chap = %s", (chapitre_id,))
    chapitre = cursor.fetchone()

    if not chapitre:
        cursor.close()
        connection.close()
        return jsonify({'error' : 'Chapitre not found'}), 404

    cursor.execute("SELECT * FROM videoscours WHERE id_chap = %s", (chapitre_id,))

    video = cursor.fetchone()
    cursor.close()
    connection.close()

    if video:
        return jsonify(video)
    else:
        return jsonify({ 'error': 'Video not found'}), 404
    
@app.route('/suivre', methods=['POST'])
def suivre_cours():
    data = request.get_json()
    id_cours = data.get('id_cours')
    id_user = data.get('id_user')

    if not all([id_cours, id_user]):
        return jsonify({ 'error': 'Missing required fields'}), 400

    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO suivre (id_user, id_cours) VALUES(%s, %s)
        """, (id_user, id_cours))

        connection.commit()
        cursor.close()
        connection.close()

        return jsonify({ 'message' : 'User is now following cours'})
    except IntegrityError as e:
        error_message = str(e)
        if "a foreign key constraint fails" in error_message:
            if "`suivre_ibfk_1`" in error_message:
                return jsonify({'error': 'User does not exist'}), 400
            elif "`suivre_ibfk_2`" in error_message:
                return jsonify({'error': 'Course does not exist'}), 400
            else:
                return jsonify({'error': 'Foreign key constraint failed'}), 400
        elif "Duplicate entry" in error_message:
            return jsonify({'error': 'User is already following the course'}), 409
        else:
            return jsonify({'error': 'Database integrity error'}), 400

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/user/<int:id_user>/suivre', methods=['GET'])
def get_cours_suivi_par_user(id_user):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("""
        SELECT cours.*
        FROM cours
        JOIN suivre ON cours.id_cours = suivre.id_cours
        WHERE suivre.id_user = %s
    """, (id_user,))

    cours_suivis = cursor.fetchall()
    cursor.close()
    connection.close()
    
    return jsonify(cours_suivis), 200