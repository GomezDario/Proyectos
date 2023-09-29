
// creo variable trayendo el button
const btnSignIn = document.getElementById("sign-in"),   
      bntSignUp = document.getElementById("sign-up"),
      formRegister = document.querySelector(".register"), // me traigo el formulario de registro
      formLogin = document.querySelector(".login") // me traigo el form de login    




btnSignIn.addEventListener("click", e =>{

    formRegister.classList.add("hide"); // se traslada hacia arria un 300%
    formLogin.classList.remove("hide")

})

bntSignUp.addEventListener("click", e =>{

    formLogin.classList.add("hide"); 
    formRegister.classList.remove("hide")
    
})


























