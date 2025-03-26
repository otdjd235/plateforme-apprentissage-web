from flask import render_template, request, redirect, url_for, jsonify, Blueprint
from flask import session
from app import app
from app.db import get_db_connection
from werkzeug.security import generate_password_hash, check_password_hash
from mysql.connector import IntegrityError

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