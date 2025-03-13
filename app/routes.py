from flask import render_template, request, redirect, url_for
from app import app
from app.db import get_db_connection

@app.route('/')
def home():
    user_logged_in = True
    return render_template('index.html', user_logged_in = user_logged_in)
    

@app.route('/profile')
def profile():
    return render_template('profile.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/signup')
def signup():
    return render_template('signup.html')

@app.route('/users')
def users():
    """Afficher tous les utilisateurs"""
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    conn.close()
    
    return render_template('users.html', users=users)

@app.route('/add_user', methods=['POST'])
def add_user():
    """Ajouter un utilisateur via un formulaire"""
    username = request.form['username']
    email = request.form['email']
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (username, email) VALUES (%s, %s)", (username, email))
    conn.commit()
    conn.close()
    
    return redirect(url_for('users'))
