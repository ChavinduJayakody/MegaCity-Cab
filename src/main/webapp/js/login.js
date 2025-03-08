/*===== FOCUS =====*/
const inputs = document.querySelectorAll(".form__input")

function addfocus(){
    let parent = this.parentNode.parentNode
    parent.classList.add("focus")
}

function remfocus(){
    let parent = this.parentNode.parentNode
    if(this.value == ""){
        parent.classList.remove("focus")
    }
}

inputs.forEach(input=>{
    input.addEventListener("focus",addfocus)
    input.addEventListener("blur",remfocus)
})

        document.getElementById("showSignup").addEventListener("click", function() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("signupForm").style.display = "block";
        });
        
        document.getElementById("showLogin").addEventListener("click", function() {
            document.getElementById("signupForm").style.display = "none";
            document.getElementById("loginForm").style.display = "block";
        });