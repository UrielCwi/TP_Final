let tasks;

function GetTareas(IdUsuario){
  $.ajax({
    type:'GET',
    datatype:'JSON',
    url:'/Home/GetTareas',
    data: {IdUsuario: IdUsuario},
    success: function(response){
      tasks = response;
      const currentDate = new Date();
      const currentYear = currentDate.getFullYear();
      const currentMonth = currentDate.getMonth();
      createCalendar(currentYear, currentMonth);
    }
  });
}

GetTareas(document.getElementById('IdUsuario').value);

function createCalendar(year, month) {
  const calendar = document.getElementById("calendar");
  calendar.innerHTML = "";

  const daysInMonth = new Date(year, month + 1, 0).getDate();

  // Crear array de nombres de los días de la semana
  const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  // Agregar nombres de los días de la semana al calendario
  for (let i = 0; i < dayNames.length; i++) {
    const dayNameElement = document.createElement("div");
    dayNameElement.classList.add("day-name");
    dayNameElement.textContent = dayNames[i];
    calendar.appendChild(dayNameElement);
  }

  // Llenar el calendario con los días del mes
  for (let i = 1; i <= daysInMonth; i++) {
      const dayElement = document.createElement("div");
      dayElement.classList.add("day");
      dayElement.textContent = i;
      dayElement.setAttribute("data-day", i);
      dayElement.addEventListener("click", () => openModal(i));
      calendar.appendChild(dayElement);
  }

  markTasks(year, month);
}

function markTasks(year, month) {
  tasks.forEach(task => {
      const taskDate = new Date(task.FechaRealizacion);
      if (taskDate.getFullYear() === year && taskDate.getMonth() === month) {
          const dayElement = document.querySelector(`.day[data-day="${taskDate.getDate()}"]`);
          if (dayElement) {
              dayElement.classList.add("task");
          }
      }
  });
}

function openModal(day) {
  const modal = document.getElementById("modal");
  const modalDay = document.getElementById("modalDay");
  const taskList = document.getElementById("taskList");

  modalDay.textContent = day;

  const tasksForDay = tasks.filter(task => {
      const taskDate = new Date(task.FechaRealizacion);
      return taskDate.getDate() === day;
  });

  taskList.innerHTML = "";
  tasksForDay.forEach(task => {
      const li = document.createElement("li");
      li.textContent = task.Nombre + ": " + task.Descripcion;
      taskList.appendChild(li);
  });

  modal.style.display = "block";
}

function closeModal() {
  const modal = document.getElementById("modal");
  modal.style.display = "none";
}

function prevMonth() {
  const currentDate = new Date();
  let currentYear = currentDate.getFullYear();
  let currentMonth = currentDate.getMonth();
  currentMonth--;
  if (currentMonth < 0) {
    currentMonth = 11;
    currentYear--;
  }
  createCalendar(currentYear, currentMonth);
}

function nextMonth() {
  const currentDate = new Date();
  let currentYear = currentDate.getFullYear();
  let currentMonth = currentDate.getMonth();
  currentMonth++;
  if (currentMonth > 11) {
    currentMonth = 0;
    currentYear++;
  }
  createCalendar(currentYear, currentMonth);
}
