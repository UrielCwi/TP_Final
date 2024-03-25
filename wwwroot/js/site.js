$(document).ready(function () {
    $('#Modal').modal('hide');
});
function limpiar(){
    $("#titulo").html();
    $("#Fecha").html();
    $("#Descripcion").html();
}
const tasks = {
    "2023-10-01": [
        { name: "Tarea 1", time: "10:00 AM" },
        { name: "Tarea 2", time: "2:00 PM" }
    ],
    "2023-10-15": [
        { name: "Tarea 3", time: "3:30 PM" }
    ],
    "2023-10-20": [
        { name: "Tarea 4", time: "11:15 AM" }
    ],
};
function createCalendar(year, month){
    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const calendar = document.getElementById("calendar");
    const table = document.createElement("table");

    // Encabezados de días de la semana
    const headerRow = document.createElement("tr");
    const daysOfWeek = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
    daysOfWeek.forEach((day) => {
        const th = document.createElement("th");
        th.textContent = day;
        headerRow.appendChild(th);
    });
    table.appendChild(headerRow);

    // Iniciar el día de la semana en 0 (domingo)
    let dayOfWeek = new Date(year, month, 1).getDay();
    if (dayOfWeek === 0) dayOfWeek = 7;

    let currentDay = 1;

    for (let i = 0; i < 6; i++) {
        if (currentDay > daysInMonth) {
            break;
        }

        const row = document.createElement("tr");

        for (let j = 1; j <= 7; j++) {
            if ((i > 0 || j >= dayOfWeek) && currentDay <= daysInMonth) {
                const td = document.createElement("td");

                // Verificar si hay tareas para esta fecha
                const dateKey = `${year}-${String(month + 1).padStart(2, "0")}-${String(currentDay).padStart(2, "0")}`;
                if (tasks[dateKey] && tasks[dateKey].length > 0) {
                    const taskMarker = document.createElement("div");
                    taskMarker.className = "task-marker";
                    td.appendChild(taskMarker);

                    const dayNumber = document.createElement("div");
                    dayNumber.className = "day-number";
                    dayNumber.textContent = currentDay;
                    td.appendChild(dayNumber);

                    const taskInfo = document.createElement("div");
                    taskInfo.className = "task-info";

                    tasks[dateKey].forEach((task) => {
                        const taskInfoText = document.createElement("div");
                        taskInfoText.className = "task-info-text";
                        taskInfoText.textContent = `${task.name} (${task.time})`;
                        taskInfo.appendChild(taskInfoText);
                    });

                    td.appendChild(taskInfo);
                } else {
                    const dayNumber = document.createElement("div");
                    dayNumber.className = "day-number";
                    dayNumber.textContent = currentDay;
                    td.appendChild(dayNumber);
                }

                row.appendChild(td);
                currentDay++;
            } else {
                const td = document.createElement("td");
                row.appendChild(td);
            }
        }

        table.appendChild(row);
    }

    calendar.innerHTML = "Topocalendario";
    calendar.appendChild(table);
}

// Obtener la fecha actual
const currentDate = new Date();
const currentYear = currentDate.getFullYear();
const currentMonth = currentDate.getMonth();

// Crear el calendario inicial
createCalendar(currentYear, currentMonth);

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

