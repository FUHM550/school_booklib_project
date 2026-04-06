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