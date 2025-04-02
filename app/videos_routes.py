from flask import Blueprint, request, jsonify, session
from app.db import get_db_connection
from mysql.connector import IntegrityError

videos_bp = Blueprint('videos', __name__)

#Recuperer les videos d'un chapitre

@videos_bp.route('/chapitres/<int:chapitre_id>/video', methods=['GET'])
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

#marquer une videos comme terminee ou suivie par un etudiant
@videos_bp.route('/videos_complete', methods=['POST'])
def video_complete():
    data = request.get_json()
    id_user = data.get('id_user') or session.get('user_id')
    id_video = data.get('id_vid')

    if not all([id_user, id_video]):
        return jsonify({ 'error': 'Missing required fields' }), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO videos_complete (id_user, id_vid) VALUES (%s, %s)
        """, (id_user, id_video))

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({ 'message': 'Video completed' }), 200
    
    except IntegrityError as e:
        if "Duplicate entry" in str(e):
            return jsonify({ 'error': 'Video already marked as completed' }), 409
        else:
            return jsonify({ 'error': 'Database integrity error' }), 400

    except Exception as e:
        return jsonify({ 'error': str(e) }), 500
    
    # Recuperer les videos terminees par un utilisateur
@videos_bp.route('/videos_complete/<int:id_user>', methods=['GET'])
def get_videos_completed_by_user(id_user):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT vc.id_vid, v.titre, v.url_video, v.id_chap
            FROM videos_complete vc
            JOIN videoscours v ON vc.id_vid = v.id_vid
            WHERE vc.id_user = %s
        """, (id_user,))

        videos = cursor.fetchall()
        cursor.close()
        conn.close()

        return jsonify(videos), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

   #Verifier si une video est terminee par un utilisateur

@videos_bp.route('/video_complete/check', methods=['POST'])
def check_video_completed():
    data = request.get_json()
    id_user = data.get('id_user') or session.get('user_id')
    id_video = data.get('id_video')

    if not all([id_user, id_video]):
        return jsonify({'error': 'Missing required fields'}), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("""
            SELECT COUNT(*) FROM videos_complete WHERE id_user = %s AND id_video = %s
        """, (id_user, id_video))

        completed = cursor.fetchone()[0] > 0

        cursor.close()
        conn.close()

        return jsonify({'completed': completed}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500


