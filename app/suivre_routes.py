from flask import Blueprint, request, jsonify
from app.db import get_db_connection
from mysql.connector import IntegrityError

suivre_bp = Blueprint('suivre', __name__)

# Pour inscrire un etudiant a un cours, il suit le cours selectionne
@suivre_bp.route('/suivre', methods=['POST'])
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

@suivre_bp.route('/user/<int:id_user>/suivre', methods=['GET'])
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