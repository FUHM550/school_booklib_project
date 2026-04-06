from flask import Flask, render_template, request, redirect, session, url_for
import sqlite3
import os

app = Flask(__name__)
app.secret_key = 'proyecto_libreria_secret'

# utility to path to db
DB_PATH = os.path.join(os.path.dirname(__file__), 'db.sqlite')

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    return render_template('inicio.html')

@app.route('/login', methods=['POST'])
def login():
    user_input = request.form.get('username')
    pass_input = request.form.get('password')
    
    conn = get_db_connection()
    # using table names 'Usuarios_Sistema' and column 'password_hash'
    user = conn.execute('SELECT * FROM Usuarios_Sistema WHERE username = ? AND password_hash = ?',
                    (user_input, pass_input)).fetchone()
    conn.close()

    if user:
        if user['estado'] == 'Inactivo':
            return "Tu cuenta está inactiva. Contacta al administrador."
            
        session['user_id'] = user['id_usuario']
        session['rol'] = user['rol']
        
        # Matches your SQL ENUMs: 'Administrador' and 'Empleado'
        if user['rol'] == 'Administrador':
            return redirect(url_for('admin_panel'))
        else:
            return redirect(url_for('empleado_panel'))
            
    return "Usuario o contraseña incorrectos. Intenta de nuevo."

@app.route('/admin')
def admin_panel():
    if session.get('rol') != 'Administrador':
        return redirect(url_for('index'))
    return render_template('admin.html')

@app.route('/empleado')
def empleado_panel():
    if session.get('rol') != 'Empleado':
        return redirect(url_for('index'))
    return render_template('empleado.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)