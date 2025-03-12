document.addEventListener("DOMContentLoaded", function () {

    document.getElementById("showDriverSignup").addEventListener("click", function () {
        document.getElementById("driverLoginForm").style.display = "none";
        document.getElementById("driverSignupForm").style.display = "block";
        resetFormSteps(); 
    });

    document.getElementById("showDriverLoginFromSignup").addEventListener("click", function () {
        document.getElementById("driverSignupForm").style.display = "none";
        document.getElementById("driverLoginForm").style.display = "block";
    });

    const steps = [document.getElementById("step1"), document.getElementById("step2"), document.getElementById("step3")];
    const nextButtons = [document.getElementById("nextButton1"), document.getElementById("nextButton2")];
    const prevButtons = [document.getElementById("prevButton1"), document.getElementById("prevButton2")];
    const progressBar = document.querySelector(".progress");

    let currentStep = 0; 

    function resetFormSteps() {
        currentStep = 0;
        showStep(currentStep);
        progressBar.style.width = "33.33%";
    }

    function showStep(step) {
        steps.forEach((s, index) => {
            s.style.display = index === step ? "block" : "none";
        });

        //  progress bar
        const progressValues = ["33.33%", "66.66%", "100%"];
        progressBar.style.width = progressValues[step];
    }

    function validateStep(step) {
        const inputs = steps[step].querySelectorAll("input");
        let isValid = true;
        inputs.forEach(input => {
            if (!input.value.trim()) {
                isValid = false;
                input.style.borderColor = "red"; 
            } else {
                input.style.borderColor = ""; 
            }
        });
        return isValid;
    }

    nextButtons.forEach((btn, index) => {
        btn.addEventListener("click", function () {
            if (validateStep(currentStep)) {
                currentStep++;
                showStep(currentStep);
            }
        });
    });

    prevButtons.forEach((btn, index) => {
        btn.addEventListener("click", function () {
            currentStep--;
            showStep(currentStep);
        });
    });

    resetFormSteps();
});

document.getElementById("email").addEventListener("blur", function () {
    const email = this.value;
    if (email) {
        fetch(`/check-email?email=${email}`)
            .then(response => response.json())
            .then(data => {
                if (data.exists) {
                    alert("Email already exists. Please use a different email.");
                    this.value = "";
                }
            });
    }
});

document.getElementById("licensePlate").addEventListener("blur", function () {
    const licensePlate = this.value;
    if (licensePlate) {
        fetch(`/check-license?licensePlate=${licensePlate}`)
            .then(response => response.json())
            .then(data => {
                if (data.exists) {
                    alert("Vehicle number already exists. Please use a different vehicle number.");
                    this.value = "";
                }
            });
    }
});

document.getElementById("rePassword").addEventListener("blur", function () {
    const password = document.getElementById("password").value;
    const rePassword = this.value;
    if (password !== rePassword) {
        alert("Passwords do not match.");
        this.value = "";
    }
});

document.getElementById("driverLoginForm").addEventListener("submit", function (event) {
    event.preventDefault();
    const email = document.getElementById("loginEmail").value;
    const password = document.getElementById("loginPassword").value;
    fetch("/driver-login", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `loginEmail=${email}&loginPassword=${password}`,
    })
    .then(response => response.text())
    .then(data => {
        if (data.includes("error")) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Incorrect email or password!',
            });
        } else {
            window.location.href = "driverLogin.jsp";
        }
    });
});