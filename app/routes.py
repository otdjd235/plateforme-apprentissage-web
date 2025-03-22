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

@app.route('/cours')
def cours():
    user_logged_in = True
    return render_template('cours.html', user_logged_in = user_logged_in)

@app.route('/exercice')
def exercice():
    return render_template('exercice.html')
