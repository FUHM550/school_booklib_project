#using database_manager (db) everywhere and removing direct sqlite3 usage for a more dynamic state compared to prev commits
from flask import Flask, render_template, request, redirect, session, url_for
import database_manager as db

# --- flask calling ---
app = Flask(__name__)
app.secret_key = 'proyecto_libreria_secret'


# --- pub routes ---
@app.route('/')
def index():
    return render_template('inicio.html')

@app.route('/login_page/<rol>')
def login_page(rol):
    return render_template('login.html', rol=rol)

@app.route('/login', methods=['POST'])
def login():
    user_input = request.form.get('username')
    pass_input = request.form.get('password')
    
    user = db.get_user_by_credentials(user_input, pass_input)

    if user:
        if user['estado'] == 'Inactivo':
            return "Tu cuenta está inactiva. Contacta al administrador."
        
        session['user_id'] = user['id_usuario']
        session['rol'] = user['rol']
        
        return redirect(url_for('admin_panel' if user['rol'] == 'Administrador' else 'empleado_panel'))
            
    return "Usuario o contraseña incorrectos. Intenta de nuevo."

# --- admin routes ---
@app.route('/admin')
def admin_panel():
    if session.get('rol') != 'Administrador':
        return redirect(url_for('index'))
    return render_template('admin.html')

@app.route('/admin/inventario')
def admin_inventario():
    if session.get('rol') != 'Administrador':
        return redirect(url_for('index'))
    
    libros = db.get_all_books()
    return render_template('inventario.html', libros=libros)

@app.route('/admin/prestamos')
def admin_prestamos():
    if session.get('rol') != 'Administrador':
        return redirect(url_for('index'))
    
    prestamos = db.get_all_prestamos()
    return render_template('prestamos.html', prestamos=prestamos)


@app.route('/admin/empleados')
def admin_empleados():
    if session.get('rol') != 'Administrador':
        return redirect(url_for('index'))
    
    usuarios = db.get_all_users()
    return render_template('empleados.html', usuarios=usuarios)

# --- empleados orute ---
@app.route('/empleado')
def empleado_panel():
    if session.get('rol') != 'Empleado':
        return redirect(url_for('index'))
    return render_template('empleado.html')

# --- exit route ---
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

# --- execute ---
if __name__ == '__main__':
    app.run(debug=True)