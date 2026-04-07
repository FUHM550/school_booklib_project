// Función para mostrar el formulario según el tipo de usuario
function mostrarFormulario(tipoUsuario) {
    const bienvenida = document.getElementById('bienvenida');
    const formularios = ['empleado', 'administrador'];

    // Ocultamos la pantalla de bienvenida
    bienvenida.classList.add('oculto');

    // Ocultamos todos los formularios primero
    formularios.forEach(id => document.getElementById(id).classList.add('oculto'));

    // Validamos que el tipo de usuario sea válido
    if (formularios.includes(tipoUsuario)) {
        document.getElementById(tipoUsuario).classList.remove('oculto');
    } else {
        console.warn(`Tipo de usuario inválido: ${tipoUsuario}`);
        bienvenida.classList.remove('oculto'); // Volvemos a mostrar bienvenida si es inválido
    }
}

// Función para regresar al menú principal
function volverAtras() {
    const bienvenida = document.getElementById('bienvenida');
    const formularios = ['empleado', 'administrador'];

    // Ocultamos todos los formularios
    formularios.forEach(id => document.getElementById(id).classList.add('oculto'));

    // Mostramos la pantalla de bienvenida
    bienvenida.classList.remove('oculto');
}