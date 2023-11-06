// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function markAsCompleted() {
    const completeButton = document.querySelector('.complete-button');
    completeButton.classList.add('completed');
    completeButton.textContent = 'Completado';
    }

    function NuevaTarea(/* Acá va la data */) {
        $.ajax({
            type: 'GET',
            datatype: 'JSON',
            url: '/Home/VerActores',
            data: { /* Acá va data: data*/},
            success:
                function (response) {
                    $("#Titulo").html(titulo);
                    $("#Cuerpo").html(descripcion);
                }
        });
    }