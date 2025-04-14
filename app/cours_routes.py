from flask import render_template, request, redirect, url_for, jsonify, Blueprint
from flask import session
from app import app
from app.db import get_db_connection
from werkzeug.security import generate_password_hash, check_password_hash
from mysql.connector import IntegrityError

@app.route('/api/cours/<int:cours_id>', methods=['GET'])
def get_cours_by_id(cours_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)

    cursor.execute("""
    SELECT
        c.*, 
        d.nom_dom AS nom_domaine 
    FROM cours c
    JOIN discipline d ON c.id_domaine = d.id_domaine
    WHERE id_cours = %s        
    """, (cours_id,))
        
    cours = cursor.fetchone();
    cursor.close()
    connection.close()

    if cours:
        return jsonify(cours)
    else:
        return jsonify({'error' : 'Cours not found'}), 404
        
@app.route('/api/cours', methods=['GET'])
def get_cours():
    page = int(request.args.get('page', 1))
    cours_per_page = int(request.args.get('cours_per_page', 10))
    offset = (page - 1) * cours_per_page

    recherche = request.args.get('recherche', '').lower()
    nom_domaine = request.args.get('nom_domaine', '')
    tri = request.args.get('tri', '')

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
        SELECT 
            c.id_cours, 
            c.nom_cours, 
            c.description_courte, 
            c.duree_totale, 
            d.nom_dom AS nom_domaine
        FROM cours c
        JOIN discipline d ON c.id_domaine = d.id_domaine
        WHERE (%s = '' OR LOWER(c.nom_cours) LIKE %s)
        AND (%s = '' OR d.nom_dom = %s)
    """
    params = [recherche, f"%{recherche}%", nom_domaine, nom_domaine]

    if tri == 'asc':
        query += " ORDER BY c.duree_totale ASC"
    elif tri == 'desc':
        query += " ORDER BY c.duree_totale DESC"

    query += " LIMIT %s OFFSET %s"
    params += [cours_per_page, offset]

    cursor.execute(query, params)
    cours = cursor.fetchall()

    count_query = """
        SELECT COUNT(*) as total
        FROM cours c
        JOIN discipline d ON c.id_domaine = d.id_domaine
        WHERE (%s = '' OR LOWER(c.nom_cours) LIKE %s)
        AND (%s = '' OR d.nom_dom = %s)
    """
    cursor.execute(count_query, [recherche, f"%{recherche}%", nom_domaine, nom_domaine])
    total = cursor.fetchone()['total']

    cursor.close()
    connection.close()

    return jsonify({
        'page': page,
        'cours_per_page': cours_per_page,
        'cours_total': total,
        'data': cours
    }), 200

@app.route('/cours/<int:cours_id>/chapitres', methods=['GET'])
def get_cours_chapitres_api(cours_id):
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

@app.route('/api/cours_complete', methods=['GET'])
def get_cours_completer():
    user_id = session.get("user_id")
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT id_cours FROM cours_complete WHERE id_user = %s", (user_id,))
    cours = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(cours)


def get_cours_chapitres(cours_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary = True)

    cursor.execute("SELECT * FROM chapitres WHERE id_cours = %s ORDER BY ordre ASC", (cours_id,))
    chapitres = cursor.fetchall()

    cursor.close()
    connection.close()
    
    return chapitres

def get_cours_completer_flag(user_id, id_chap):
    connection = get_db_connection()
    cursor = connection.cursor()

    cursor.execute("""
        SELECT 1 FROM chapitres_complete
        WHERE id_user = %s AND id_chap = %s
    """, (user_id, id_chap))
    completed = cursor.fetchone() is not None
    cursor.close()
    connection.close()

    return completed

#Prend en parametre listes de chapitres associer au cours qui a deja ete chercher avant
def get_chapitre_completed_map(id_user, chapitres):
    connection = get_db_connection()
    cursor = connection.cursor()

    chapitres_ids = [chapitre["id_chap"] for chapitre in chapitres]
    chapitres_complete_dict = {chapitre_id: False for chapitre_id in chapitres_ids}

    if chapitres_ids:
        placeholders = ','.join(['%s'] * len(chapitres_ids))
        query = f"""
            SELECT id_chap FROM chapitres_complete 
            WHERE id_user = %s AND id_chap IN ({placeholders})
        """
        params = [id_user] + chapitres_ids
        cursor.execute(query, params)

        for (completed_chapitre,) in cursor.fetchall():
            chapitres_complete_dict[completed_chapitre] = True

    return chapitres_complete_dict


def is_all_chapitres_completed(id_user, chapitres):
    connection = get_db_connection()
    cursor = connection.cursor()

    chapitres_ids = [chapitre["id_chap"] for chapitre in chapitres]

    if not chapitres_ids:
        return False

    placeholders = ','.join(['%s'] * len(chapitres_ids))
    query = f"""
        SELECT COUNT(*) FROM chapitres_complete 
        WHERE id_user = %s AND id_chap IN ({placeholders})
    """
    params = [id_user] + chapitres_ids
    cursor.execute(query, params)
    completed_count = cursor.fetchone()[0]

    return completed_count == len(chapitres_ids)


def get_cours_completes_profile(id_user):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT c.*, d.nom_dom AS nom_domaine
        FROM cours_complete cc
        JOIN cours c ON cc.id_cours = c.id_cours
        JOIN discipline d ON c.id_domaine = d.id_domaine
        WHERE cc.id_user = %s
    """, (id_user,))

    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result


