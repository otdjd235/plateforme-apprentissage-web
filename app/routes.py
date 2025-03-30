from flask import render_template, request, redirect, url_for
from app import app
from app.db import get_db_connection
from flask import session

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

    return render_template('profile.html', user=user_data)

@app.route('/login')
def login_api():
    return render_template('login.html')

@app.route('/signup')
def signup():
    return render_template('signup.html')

@app.route('/cours')
def cours():
    user_logged_in = True
    return render_template('cours.html')

@app.route('/exercice')
def exercice():
    return render_template('exercice.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))
