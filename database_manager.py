import sqlite3
import os

DB_PATH = os.path.join(os.path.dirname(__file__), 'db.sqlite')

def get_db_connection():
    db_path = resource_path('db.sqlite')
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    return conn

# --- usr functions ---
def get_user_by_credentials(username, password):
    conn = get_db_connection()
    user = conn.execute(
        'SELECT * FROM Usuarios_Sistema WHERE username = ? AND password_hash = ?',
        (username, password)
    ).fetchone()
    conn.close()
    return user

def get_all_users():
    conn = get_db_connection()
    users = conn.execute('SELECT * FROM Usuarios_Sistema').fetchall()
    conn.close()
    return users

# --- inventoary functions ---
def get_all_books():
    conn = get_db_connection()
    # Selecting columns based on your schema 
    libros = conn.execute('SELECT isbn, titulo, autor, stock_total FROM Libros').fetchall()
    conn.close()
    return libros

# --- LOAN FUNCTIONS ---
def get_all_prestamos():
    conn = get_db_connection()
    # columns DB are: isbn_libro, id_cliente, id_empleado_registro
    query = '''
        SELECT p.id_prestamo, u.nombre_completo as nombre_usuario, l.titulo, 
               p.fecha_prestamo, p.fecha_limite, p.estado
        FROM Prestamos p
        JOIN Libros l ON p.isbn_libro = l.isbn
        JOIN Usuarios_Sistema u ON p.id_empleado_registro = u.id_usuario
    '''
    prestamos = conn.execute(query).fetchall()
    conn.close()
    return prestamos

# --- tranlation (forgot the thing was in spanish lol) ---
def get_all_loans():
    return get_all_prestamos()

