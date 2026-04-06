// Esta función recibe un "tipo" (que será 'admin' o 'empleado')
function mostrarFormulario(tipoUsuario) {
    
    //Ocultamos la pantalla de bienvenida
    document.getElementById('bienvenida').style.display = 'none';
    
    // 2. Revisamos qué botón presionaron y mostramos el formulario correspondiente
    if (tipoUsuario === 'empleado') {
        // Mostramos el div del empleado
        document.getElementById('empleado').style.display = 'block';
    } 
    else if (tipoUsuario === 'administrador') {
        // Mostramos el div del administrador
        document.getElementById('administrador').style.display = 'block';
    }
}

// Función para regresar al menú principal
function volverAtras() {
    //Ocultamos ambos formularios (por si acaso)
    document.getElementById('empleado').style.display = 'none';
    document.getElementById('administrador').style.display = 'none';
    
    //Volvemos a mostrar la pantalla de bienvenida original
    document.getElementById('bienvenida').style.display = 'block';
}
