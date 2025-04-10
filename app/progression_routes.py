from flask import Blueprint, request, jsonify
from app.db import get_db_connection

progression_bp = Blueprint('progression', __name__)

@progression_bp.route('/suivre/progression', methods=['GET'])
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
    

@progression_bp.route('/complete_chapitre', methods=['POST'])
def complete_chapitre():
    data = request.get_json()
    id_user = data['id_user']
    id_chap = data['id_chap']
    id_cours = data['id_cours']

    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute("""
        INSERT INTO chapitres_complete (id_user, id_chap)
        SELECT %s, %s
        WHERE NOT EXISTS (
            SELECT 1 FROM chapitres_complete WHERE id_user = %s AND id_chap = %s
        )
    """, (id_user, id_chap, id_user, id_chap))

    cursor.execute("""
        SELECT COUNT(*) FROM chapitres WHERE id_cours = %s
    """, (id_cours,))
    total_chapitres = cursor.fetchone()[0]

    cursor.execute("""
        SELECT COUNT(*) FROM chapitres_complete c
        JOIN chapitres ch ON c.id_chap = ch.id_chap
        WHERE c.id_user = %s AND ch.id_cours = %s
    """, (id_user, id_cours))
    completed = cursor.fetchone()[0]

    if total_chapitres == 0:
        progression_percent = 0
    else:
        progression_percent = round((completed / total_chapitres) * 100)
        progression_percent = min(progression_percent, 100)

    cursor.execute("""
        UPDATE suivre SET progression = %s
        WHERE id_user = %s AND id_cours = %s
    """, (progression_percent, id_user, id_cours))

    connection.commit()
    cursor.close()
    connection.close()
    return '', 204
