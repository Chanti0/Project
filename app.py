from flask import Flask, render_template,flash, request, redirect, url_for, session
from flask_mysqldb import MySQL
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user
# import numpy as np
import pandas as pd
# import os  
app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Database Configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'San@_123'
app.config['MYSQL_DB'] = 'disease_inputs'

mysql = MySQL(app)
login_manager = LoginManager(app)
login_manager.login_view = 'login'  

# User Class for Flask-Login
class User(UserMixin):
    def __init__(self, id):
        self.id = id

@login_manager.user_loader
def load_user(user_id):
    return User(user_id)

# Home Page
@app.route('/')
def home():
    return render_template('home.html')

# Register Page
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username')       
        email = request.form.get('email')
        age = request.form.get('age')
        phone = request.form.get('phone')
        password = request.form.get('password')
        confirm_password = request.form.get('confirm_password')

        
        if not all([username, email, age, phone, password, confirm_password]):
            flash("All fields are required!", "danger")
            return redirect(url_for('register'))

        if password != confirm_password:
            flash("Passwords do not match!", "danger")
            return redirect(url_for('register'))

        try:
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO userss (username, email, age, phone, password) VALUES (%s, %s, %s, %s, %s)",
                        (username, email, age, phone, password))
            mysql.connection.commit()
            cur.close()

            flash("Registration successful! Please log in.", "success")
            return redirect(url_for('login'))
        except Exception as e:
            flash(f"Error: {str(e)}", "danger")
            return redirect(url_for('register'))

    return render_template('register.html')


# Login Page
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM userss WHERE username=%s AND password=%s", (username, password))
        user = cur.fetchone()
        cur.close()

        if user:
            login_user(User(user[0]))  
            session['username'] = username  
            return redirect(url_for('predict'))
        else:
            flash("Invalid username or password!", "danger")
            return redirect(url_for('login'))

    return render_template('login.html')
    
# Predict Page
@app.route('/predict', methods=['GET', 'POST'])
@login_required
def predict():
    if request.method == 'POST':
        name = request.form.get('name')
        age = request.form.get('age')
        gender = request.form.get('gender')
        symptoms = request.form.get('symptoms')

        if not all([name, age, gender, symptoms]):
            flash("All fields are required!", "danger")
            return redirect(url_for('predict'))
        cur.execute("SELECT * FROM disease_inform")
        diseases = cur.fetchall()
        cur.close()

        matched_disease = None
        for disease in diseases:
            print(disease)
            disease_symptoms = disease[2].split(',')
            print(disease_symptoms)
            if set(symptoms_list).issubset(set(disease_symptoms)):
                matched_disease = {
                    'name': disease[1],
                    'medicines': disease[3],
                    'diet': disease[4],
                    'specialist': disease[5]
                }
                break

        if matched_disease:
            return render_template('result.html', result=matched_disease)
        else:
            flash("No matching disease found! Consult a doctor.", "warning")
            return redirect(url_for('predict'))

    return render_template('predict.html')

# Result Page
@app.route('/result')
@login_required
def result():
    return render_template('result.html')


# Logout
@app.route('/logout')
@login_required
def logout():
    session.pop('username', None) 
    logout_user()
    flash("You have been logged out.", "info")
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)
