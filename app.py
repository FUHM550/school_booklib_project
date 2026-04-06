@app.route('/login', methods=['POST'])
def login():
    user = request.form.get('username')
    pw = request.form.get('password')
    
    # this  modifies the structure of the db, by addind users table
    # query = "SELECT role FROM usuarios WHERE user=? AND pass=?"
    # under the roles designated we have
    # 'admin' -> redirect('/admin')
    # 'empleado' -> redirect('/empleado')

    # refer to the .env

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class UsuarioSistema(db.Model):
    __tablename__ = 'Usuarios_Sistema'
    id_usuario = db.Column(db.Integer, primary_key=True)
    nombre_completo = db.Column(db.String(100), nullable=False)
    username = db.Column(db.String(50), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    rol = db.Column(db.String(20), nullable=False) # roles
    estado = db.Column(db.String(20), default='Activo')




    from flask import Flask, render_template, request, redirect, session, url_for
import sqlite3 

app = Flask(__name__)
app.secret_key = 'proyecto_libreria_secret'

# function to connect DB
def get_db_connection():
    conn = sqlite3.connect('libreria_pro.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    return render_template('inicio.html')

@app.route('/login', methods=['POST'])
def login():
    # get data from html
    user_input = request.form.get('username')
    pass_input = request.form.get('password')
    
    # check db
    conn = get_db_connection()
    user = conn.execute('SELECT * FROM Usuarios_Sistema WHERE username = ? AND password_hash = ?',
                        (user_input, pass_input)).fetchone()
    conn.close()

    # validation 
    if user:
        if user['estado'] == 'Inactivo':
            return "Tu cuenta está inactiva. Contacta al administrador."
            
        session['user_id'] = user['id_usuario']
        session['rol'] = user['rol']
        
        # redirect ENUM from SQL
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

if __name__ == '__main__':
    app.run(debug=True)