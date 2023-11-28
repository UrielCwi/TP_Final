$(document).ready(function () {
    $('#Modal').modal('hide');
});
function limpiar(){
    $("#titulo").html();
    $("#Fecha").html();
    $("#Descripcion").html();
}
function markAsCompleted() {
    const completeButton = document.querySelector('.complete-button');
    completeButton.classList.add('completed');
    completeButton.textContent = 'Completado';
}

function MostrarDetalles(IdT) {
    $.ajax({
        type:'POST',
        datatype: 'JSON',
        url: '/Home/VerDetalleTarea',
        data: {IdTarea: IdT},
        success:
            function(response){
                limpiar();
                $("#Tarea").val(response.idTarea);
                $("#Usuario").val(response.idUsuario);
                $("#titulo").html(response.nombre);
                $("#Fecha").html(response.fechaRealizacion);
                $("#Descripcion").html(response.descripcion);
                $("#Modal").modal('show');
            }
    })
}
function EditarTarea() {
    let IdT=$("#Tarea").val();
    $.ajax({
        type:'POST',
        datatype: 'JSON',
        url: '/Home/VerDetalleTarea',
        data: {IdTarea: IdT},
        success:
            function(response){
            }
    })
}

function confirmarEliminacion() {
    let IdT=$("#Tarea").val();
    let IdU=$("#Usuario").val();
    const response = confirm("¿Estás seguro de que quieres eliminar esta tarea?");
    console.log(response);
    if (response) {
        $.ajax({
            type:'POST',
            datatype: 'JSON',
            url: '/Home/EliminarTarea',
            data: {IdTarea: IdT, idUsuario: IdU},
            success:
                function(response){
                    location.reload()
                }
        })
        // Agregar acá la lógica para eliminar la tarea (LLamar al controller)
        //  ejemplo simple utilizando la función fetch de JavaScript:
        /*
        fetch('/EliminarTarea/' + tareaId, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
        })
        .then(response => response.json())
        .then(data => {
            console.log('Tarea eliminada:', data);
            // Puedes hacer algo más después de eliminar la tarea, como recargar la página o actualizar la interfaz de usuario.
        })
        .catch((error) => {
            console.error('Error al eliminar la tarea:', error);
        });
        */
    }
}