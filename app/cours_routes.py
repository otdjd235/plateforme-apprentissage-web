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
    return jsonify(chapitres), 200 