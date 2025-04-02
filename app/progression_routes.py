from flask import Blueprint, request, jsonify
from app.db import get_db_connection

progression_bp = Blueprint('progression', __name__)

@progression_bp.route('/progression', methods=['GET'])
def get_progression():
    id_user = request.args.get('id_user')
    id_cours = request.args.get('id_cours')

    if not all([id_user, id_cours]):
        return jsonify({'error': 'Missing id_user or id_cours'}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT progression FROM suivre
            WHERE id_user = %s AND id_cours = %s
        """, (id_user, id_cours))
        result = cursor.fetchone()

        cursor.close()
        conn.close()

        if not result:
            return jsonify({'error': 'Aucune progression trouvée'}), 404

        return jsonify({
            'id_user': id_user,
            'id_cours': id_cours,
            'progression': result['progression']
        }), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500
