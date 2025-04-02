from flask import Blueprint, request, jsonify
from app.db import get_db_connection

certifications_bp = Blueprint('certifications', __name__)

@certifications_bp.route('/user/<int:id_user>/certifications', methods=['GET'])
def get_certifications_by_user(id_user):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT c.id_certif, c.date_obtention, cours.nom_cours AS nom_cours, c.id_domaine
            FROM certifications c
            JOIN cours ON c.id_cours = cours.id_cours
            WHERE c.id_user = %s
            ORDER BY c.date_obtention DESC
        """, (id_user,))
        
        certifications = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify(certifications), 200

    except Exception as e:
        return jsonify({ 'error': str(e) }), 500
