function mostrarFormulario(tipo) {
    // 1. Ocultar la pantalla de bienvenida
    document.getElementById('bienvenida').style.display = 'none';
    
    // 2. Ocultar ambos formularios por si acaso
    document.getElementById('empleado').style.display = 'none';
    document.getElementById('administrador').style.display = 'none';

    // 3. Mostrar el formulario solicitado
    const formulario = document.getElementById(tipo);
    if (formulario) {
        formulario.style.display = 'block';
    }
}

function volverAtras() {
    // 1. Ocultar los formularios
    document.getElementById('empleado').style.display = 'none';
    document.getElementById('administrador').style.display = 'none';
    
    // 2. Mostrar la bienvenida
    document.getElementById('bienvenida').style.display = 'block';
}