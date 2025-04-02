from flask import Blueprint, jsonify, request
from app.db import get_db_connection

# Création du Blueprint pour les routes liées aux disciplines
disciplines_bp = Blueprint('disciplines', __name__)

# 🔹 Route : récupérer toutes les disciplines
@disciplines_bp.route('/api/disciplines', methods=['GET'])
def get_all_disciplines():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("SELECT * FROM discipline")
    disciplines = cursor.fetchall()

    cursor.close()
    connection.close()

    return jsonify(disciplines), 200

# 🔹 Route : récupérer tous les cours d'une discipline
@disciplines_bp.route('/api/<int:id_discipline>/cours', methods=['GET'])
def get_cours_by_discipline(id_discipline):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    # Vérifie si la discipline existe
    cursor.execute("SELECT * FROM discipline WHERE id_domaine = %s", (id_discipline,))
    discipline = cursor.fetchone()

    if not discipline:
        cursor.close()
        connection.close()
        return jsonify({'error': 'Discipline not found'}), 404

    # Récupère les cours associés à la discipline
    cursor.execute("SELECT * FROM cours WHERE id_domaine = %s", (id_discipline,))
    cours = cursor.fetchall()

    cursor.close()
    connection.close()

    return jsonify({
        'discipline': discipline,
        'cours': cours
    }), 200
