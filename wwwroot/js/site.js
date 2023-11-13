function markAsCompleted() {
    const completeButton = document.querySelector('.complete-button');
    completeButton.classList.add('completed');
    completeButton.textContent = 'Completado';
}

function NuevaTarea() {
    $.ajax({
        type: 'GET',
        datatype: 'JSON',
        url: '/Home/Tareas',
        data: {},
        success:
            function (response) {
                $("#Titulo").html(titulo);
                $("#Cuerpo").html(descripcion);
            }
    });
}
const nuevaTareaButton = document.getElementById("nuevaTareaButton");
const modal = document.getElementById("modal");
const close = document.querySelector(".close");
const tareaForm = document.getElementById("tareaForm");
nuevaTareaButton.addEventListener("click", () => {
    modal.style.display = "block";
});
close.addEventListener("click", () => {
    modal.style.display = "none";
});
window.addEventListener("click", (event) => {
    if (event.target == modal) {
        modal.style.display = "none";
    }
});
tareaForm.addEventListener("submit", (event) => {
    event.preventDefault();
    const nombreTarea = document.getElementById("nombreTarea").value;
    const categoria = document.getElementById("categoria").value;
    const descripcion = document.getElementById("descripcion").value;
    const fechaHora = document.getElementById("fechaHora").value;
    modal.style.display = "none";
});
const filterOptions = document.getElementById("filterOptions");
const resultadoFiltro = document.getElementById("resultadoFiltro");
function filtrarPorOpcion(event) {
    const opcionSeleccionada = event.target.getAttribute("data-value");
    let resultado = "";
    switch (opcionSeleccionada) {
        case "dia":
            resultado = "Filtrar por Día";
            break;
        case "semana":
            resultado = "Filtrar por Semana";
            break;
        case "mes":
            resultado = "Filtrar por Mes";
            break;
        default:
            resultado = "Selecciona una opción válida";
    }
    const filterOptionElements = document.querySelectorAll(".filter-option");
    filterOptionElements.forEach((option) => {
        option.classList.remove("selected");
    });
    event.target.classList.add("selected");

    resultadoFiltro.textContent = resultado;
}
const filterOptionElements = document.querySelectorAll(".filter-option");
filterOptionElements.forEach((option) => {
    option.addEventListener("click", filtrarPorOpcion);
});
