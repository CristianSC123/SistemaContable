const hamBurger = document.querySelector(".toggle-btn");

// Agrega un evento de clic al botón de hamburguesa
hamBurger.addEventListener("click", function () {
  // Cuando se hace clic en el botón de hamburguesa, toggle (añadir o quitar) la clase "expand" en el elemento con ID "sidebar"
  document.querySelector("#sidebar").classList.toggle("expand");
});

// Función para alternar la visibilidad de un formulario basado en su ID
function toggleForm(formId) {
  var form = document.getElementById(formId);
  if (form) { // Verifica si el formulario con el ID proporcionado existe
    form.classList.toggle('hidden'); // Toggle (añadir o quitar) la clase 'hidden' para alternar la visibilidad del formulario
  } else {
    console.error('Formulario con ID ' + formId + ' no encontrado.'); // Muestra un mensaje de error si el formulario no se encuentra
  }
}
