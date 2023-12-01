$(document).ready(function () {
    $('#Modal').modal('hide');
});
function limpiar(){
    $("#titulo").html();
    $("#Fecha").html();
    $("#Descripcion").html();
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
                let Fecha = new Date(response.fechaRealizacion)
                Fecha.toDateString();
                $("#Tarea").val(response.idTarea);
                $("#Usuario").val(response.idUsuario);
                $("#titulo").html(response.nombre);
                $("#Nombre").val(response.nombre);
                $("#Fecha").html(Fecha);
                $("#Fecha2").val(Fecha);
                $("#Descripcion").html(response.descripcion);
                $("#Descripcion2").val(response.descripcion);
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

