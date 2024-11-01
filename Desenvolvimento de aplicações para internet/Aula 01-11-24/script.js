const nome = document.getElementById("nome");
const senha = document.getElementById("senha");
const login = document.getElementById("login");

const mostrarAviso = (ev) => {
    const target = ev.target;
    target.nextElementSibling.style.visibility = target.value.length < 3 ? "visible" : "hidden";
    target.nextElementSibling.style.opacity = target.value.length < 3 ? "1" : "0";
};

nome.addEventListener("keyup", mostrarAviso);
senha.addEventListener("keyup", mostrarAviso);

login.addEventListener("click", (ev) => {
    nome.value = "";
    senha.value = "";
});
