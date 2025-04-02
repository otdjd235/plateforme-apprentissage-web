from flask import Blueprint, request, jsonify, session
from app.db import get_db_connection
from mysql.connector import IntegrityError

exercices_bp = Blueprint('exercices', __name__)

# Récupérer tous les exercices d'un chapitre

@exercices_bp.route('/chapitres/<int:id_chap>/exercices', methods=['GET'])
def get_exercices_par_chapitre(id_chap):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    # Vérifier que le chapitre existe
    cursor.execute("SELECT * FROM chapitres WHERE id_chap = %s", (id_chap,))
    chapitre = cursor.fetchone()

    if not chapitre:
        cursor.close()
        connection.close()
        return jsonify({'error': 'Chapitre non trouvé'}), 404

    # Récupérer les exercices liés au chapitre
    cursor.execute("SELECT * FROM exercice WHERE id_chap = %s", (id_chap,))
    exercices = cursor.fetchall()

    cursor.close()
    connection.close()

    if exercices:
        return jsonify(exercices), 200
    else:
        return jsonify({'message': 'Aucun exercice trouvé pour ce chapitre'}), 200

# marque un exercice comme completé

@exercices_bp.route('/exercice_complete', methods=['POST'])
def exercice_complete():
    data = request.get_json()
    id_user = data.get('id_user') or session.get('user_id')
    id_exercice = data.get('id_exo')

    if not all([id_user, id_exercice]):
        return jsonify({ 'error': 'Champs requis manquants' }), 400

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO exercices_complete (id_user, id_exo) VALUES (%s, %s)
        """, (id_user, id_exercice))

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({ 'message': 'Exercice marqué comme complété' }), 200
    
    except IntegrityError as e:
        if "Duplicate entry" in str(e):
            return jsonify({ 'error': 'Exercice déjà complété' }), 409
        else:
            return jsonify({ 'error': 'Erreur d’intégrité base de données' }), 400

    except Exception as e:
        return jsonify({ 'error': str(e) }), 500


# Recuperer les exercices termines par un utilisateur
@exercices_bp.route('/user/<int:id_user>/exercices_complete', methods=['GET'])
def get_exercices_completes(id_user):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT e.id_exo AS titre_exercice,
                   c.id_chap, c.titre_chap AS titre_chapitre,
                   co.id_cours, co.nom_cours AS nom_cours,
                   ec.date_completion
            FROM exercices_complete ec
            JOIN exercice e ON ec.id_exo= e.id_exo
            JOIN chapitres c ON e.id_chap = c.id_chap
            JOIN cours co ON c.id_cours = co.id_cours
            WHERE ec.id_user = %s
            ORDER BY co.nom_cours, c.ordre, e.id_exo
        """, (id_user,))

        exercices = cursor.fetchall()
        cursor.close()
        conn.close()

        return jsonify(exercices), 200
    
    except Exception as e:
        return jsonify({ 'error': str(e) }), 500

#Pour verifier si un exercice a ete fait

@exercices_bp.route('/exercices_complete/<int:id_user>/<int:id_exo>', methods=['GET'])
def check_exercice_complete(id_user, id_exo):
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT COUNT(*) FROM exercices_complete 
        WHERE id_user = %s AND id_exo = %s
    """, (id_user, id_exo))

    result = cursor.fetchone()[0]
    cursor.close()
    conn.close()

    if result > 0:
        return jsonify({'completed': True})
    else:
        return jsonify({'completed': False})
