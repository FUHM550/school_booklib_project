document.addEventListener("DOMContentLoaded", function() {
    // 1. VARIABLES: Obtenemos todos los elementos del HTML
    
    
    // Menú y vistas
    const navInventario = document.getElementById("nav-inventario");
    const navUsuarios = document.getElementById("nav-usuarios");
    const navPrestamos = document.getElementById("nav-prestamos");
    const btnAtras = document.getElementById("btn-atras");
    
    const vistaInventario = document.getElementById("vista-inventario");
    const vistaUsuarios = document.getElementById("vista-usuarios");
    const vistaPrestamos = document.getElementById("vista-prestamos");
    
    // Formulario de Clientes
    const btnAgregarCliente = document.getElementById("btn-agregar-cliente");
    const inputNombreCliente = document.getElementById("nombre-cliente");
    const inputEmailCliente = document.getElementById("email-cliente");
    const listaClientes = document.getElementById("lista-clientes");

    // Formulario de Préstamos
    const btnRegistrarPrestamo = document.getElementById("btn-registrar-prestamo");
    const inputLibroPrestamo = document.getElementById("prestamo-libro");
    const inputUsuarioPrestamo = document.getElementById("prestamo-usuario");
    const inputFechaPrestamo = document.getElementById("prestamo-fecha");
    const listaPrestamos = document.getElementById("lista-prestamos");


    // 2. LÓGICA DE NAVEGACIÓN ENTRE VISTAS
    // Verificamos que todos los elementos existan antes de agregar eventos
    if (navInventario && navUsuarios && navPrestamos && vistaInventario && vistaUsuarios && vistaPrestamos) {
        
        //  Menú Usuarios
        navUsuarios.addEventListener("click", function(evento) {
            evento.preventDefault(); 
            vistaInventario.classList.add("oculto");
            vistaPrestamos.classList.add("oculto");
            vistaUsuarios.classList.remove("oculto");
        });

        // Menú Inventario 
        navInventario.addEventListener("click", function(evento) {
            evento.preventDefault();
            vistaUsuarios.classList.add("oculto");
            vistaPrestamos.classList.add("oculto");
            vistaInventario.classList.remove("oculto");
        });

        // Menú Préstamos
        navPrestamos.addEventListener("click", function(evento) {
            evento.preventDefault();
            vistaInventario.classList.add("oculto");
            vistaUsuarios.classList.add("oculto");
            vistaPrestamos.classList.remove("oculto"); 
        });

        // Botón Atrás (Regresa a inventario) 
        if (btnAtras) {
            btnAtras.addEventListener("click", function(evento) {
                evento.preventDefault(); 
                vistaUsuarios.classList.add("oculto");
                vistaPrestamos.classList.add("oculto");
                vistaInventario.classList.remove("oculto");
            });
        }
    }


    
    // 3. LÓGICA PARA AGREGAR CLIENTES
    if (btnAgregarCliente) {
        btnAgregarCliente.addEventListener("click", function() {
            const nombre = inputNombreCliente.value;
            const correo = inputEmailCliente.value;

            if (nombre === "" || correo === "") {
                alert("Por favor, llena el nombre y el correo del cliente.");
                return; 
            }

            const nuevaFila = document.createElement("tr");
            nuevaFila.innerHTML = `
                <td>${nombre}</td>
                <td>${correo}</td>
                <td>
                    <button class="btn-editar">Editar</button>
                    <button class="btn-eliminar">Eliminar</button>
                </td>
            `;

            listaClientes.appendChild(nuevaFila);
            inputNombreCliente.value = "";
            inputEmailCliente.value = "";
        });
    }


  
    // 4. LÓGICA PARA REGISTRAR PRÉSTAMOS 
    if (btnRegistrarPrestamo) {
        btnRegistrarPrestamo.addEventListener("click", function() {
            // Extraemos los valores
            const libro = inputLibroPrestamo.value;
            const usuario = inputUsuarioPrestamo.value;
            const fecha = inputFechaPrestamo.value;

            // Validamos que no falte nada
            if (libro === "" || usuario === "" || fecha === "") {
                alert("Por favor, llena todos los datos del préstamo (Libro, Cliente y Fecha).");
                return;
            }

            // Creamos la nueva fila
            const nuevaFila = document.createElement("tr");
            nuevaFila.innerHTML = `
                <td>${libro}</td>
                <td>${usuario}</td>
                <td>${fecha}</td>
                <td style="color: orange; font-weight: bold;">Pendiente</td>
                <td>
                    <button class="btn-editar">Devuelto</button>
                </td>
            `;

            // Agregamos a la tabla y limpiamos
            listaPrestamos.appendChild(nuevaFila);
            
            inputLibroPrestamo.value = "";
            inputUsuarioPrestamo.value = "";
            inputFechaPrestamo.value = "";
        });
    }

});