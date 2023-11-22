$(document).ready(function () {
    $('#Modal').modal('hide');
});

function markAsCompleted() {
    const completeButton = document.querySelector('.complete-button');
    completeButton.classList.add('completed');
    completeButton.textContent = 'Completado';
}

function NuevaTarea() {
    $.ajax({
        type: 'POST',
        datatype: 'JSON',
        url: '/Home/AgregarTarea',
        data: {},
        success:
            function (response) {
                
            }
    });
}