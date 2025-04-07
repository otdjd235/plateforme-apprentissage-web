from flask import render_template, request, redirect, url_for
from app import app
from app.db import get_db_connection
from flask import session, jsonify
from app.cours_routes import get_cours_chapitres, get_videos_chapitres
from app.suivre_routes import get_cours_suivi
from app.exercices_routes import api_get_exercices_par_chapitres

@app.context_processor
def user_status():
    return {
        'user_logged_in': 'user_id' in session,
        'session_user': session
    }

@app.route('/')
def home():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute('SELECT * FROM cours')
    cours = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('index.html', cours=cours)

@app.route('/api/cours_suivi')
def api_cours_suivi():
    cours_suivi = get_cours_suivi(session.get("user_id"))
    return jsonify(cours_suivi)
    
@app.route('/profile')
def profile():
    if 'user_id' not in session:
        return redirect(url_for('login_api'))

    user_data = {
        'username': session.get('username'),
        'email': session.get('email'),
        'tel': session.get('tel'),
        'date_naissance': session.get('date_naissance'),
        'role': session.get('role')
    }

    cours_suivi = get_cours_suivi(session.get('user_id'))

    return render_template('profile.html', user=user_data, cours_suivi=cours_suivi)

@app.route('/login')
def login_api():
    return render_template('login.html')

@app.route('/signup')
def signup():
    return render_template('signup.html')

@app.route('/cours/<int:cours_id>')
def cours(cours_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("""
    SELECT
        c.*, 
        d.nom_dom AS nom_domaine 
    FROM cours c
    JOIN discipline d ON c.id_domaine = d.id_domaine
    WHERE id_cours = %s        
    """, (cours_id,))
    
    cours = cursor.fetchone()

    cursor.close()
    connection.close()

    if not cours:
        return "Cours non trouver", 404
    
    chapitres = get_cours_chapitres(cours_id)
    
    return render_template("cours.html", cours=cours, chapitres=chapitres)

@app.route('/exercice/<int:id_chap>')
def exercice(id_chap):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute('SELECT * FROM chapitres WHERE id_chap = %s', (id_chap,))
    chapitre = cursor.fetchone()

    cursor.close()
    connection.close()

    if not chapitre:
        return "Chapitre non trouver", 404
    
    video = get_videos_chapitres(id_chap)

    exercice = api_get_exercices_par_chapitres(id_chap)

    return render_template('exercice.html', chapitre=chapitre, video=video, exercice=exercice)

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))

