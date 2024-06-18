
const hamBurger = document.querySelector(".toggle-btn");


hamBurger.addEventListener("click", function () {
  document.querySelector("#sidebar").classList.toggle("expand");
});


function toggleForm(formId) {
  var form = document.getElementById(formId);
  if (form) { 
    form.classList.toggle('hidden'); 
  } else {
    console.error('Formulario con ID ' + formId + ' no encontrado.'); 
  }
}
