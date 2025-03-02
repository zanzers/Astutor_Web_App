function validateEmail() {
    let email = $userInput.val().trim();
    let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email === "") {
        $errorMessage.text("Email cannot be empty").show();
        $userInput.addClass("error-border-user");
        userValid = false;
    } else if (!emailRegex.test(email)) {
        $errorMessage.text("Invalid email format").show();
        $userInput.addClass("error-border-user");
        userValid = false;
    } else {
        $errorMessage.hide();
        $userInput.removeClass("error-border-user")
        userValid = true;
    }
}

function generateCode() {

    let username = $userInput.val().trim();

    if(!userValid){
        alert("Please enter a valid email before requesting an OTP.");
        return
    }

    otp = Math.floor(100000 + Math.random() * 900000);
    codeExpires = false;

    $otpBtn.prop("disabled", true);
    $otpBtn.attr("data-content", `Resent (${countdown}s)`).text("");
    
    let timer = setInterval(function () {
        countdown--;
        $otpBtn.attr("data-content", `Resent (${countdown}s)`).text("");

    if (countdown === 0) {
        clearInterval(timer);
        $otpBtn.prop("disabled", false);
        $otpBtn.attr("data-content", "Send");
        otp = null;
        codeExpires = true;
        }
    }, 1000);

    alert(`\nUsername: ${username}\nVerification Code: ${otp}\n(Note: Code is valid for 160 seconds.)`);
}

function verifyUserCode(){
    let userCode = $otpInput.val().trim();
    console.log(userCode,otp)

    if(!userValid){
        alert("The verification code has expired. Please request a new one.");
        return
    }else if (userCode === otp.toString()){
        alert("Verification successful")
        userCodeValid = true;
    } else{
        alert("Invalid verification code. Please try again.");
    }
}

function validatePassword() {
    let password = $password.val().trim();
    console.log("userpassword")
    let regex = /^(?=.*[A-Za-z])(?=.*\d|.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,30}$/;

    let password_error = ["Password cannot be empty", "Password must be 8-30 characters and contain letters, numbers, or special characters"]

    if( password === ""){
        $errorPassword.text(password_error[0]).show();
        $password.addClass("error-border");
        return false;
    }
    if(!regex.test(password)){
        $errorPassword.text(password_error[1]).show();
        $password.addClass("error-border");
        return false;
    }else {
        $errorPassword.hide();
        $password.removeClass("error-border");
        passValid = true;
    }
}

function validateConfirmPassword(){

    let password = $password.val().trim();
    let confirmPassword = $confirmPassword.val().trim();

    let confim_pass = ["Password confirmation cannot be empty", "Please make sure the passwords you enter both times are the same"]

    if (confirmPassword === ""){
        $confirmError.text(confim_pass[0]).show()
        $confirmPassword.addClass("error-border");
        return false;
    }else if(password !== confirmPassword){
        $confirmError.text(confim_pass[1]).show()
        $confirmPassword.addClass("error-border");
        return false;
    }else {
        $confirmError.hide()
        $confirmPassword.removeClass("error-border");
        confimPassValid = true;
    }

}


function validateTerms(){
    if(!$termsCheckbox.is(":checked")){
        alert("You must agree to the Terms of Service and Privacy Policy");
    }else {
        verifyUserCode();
        checkInputs();
        console.log("confirmTerms");
    }
    

}

function checkInputs() {
    console.log("checkinputs")
    console.log(userValid, userCodeValid, passValid, confimPassValid)


    if(userValid && userCodeValid && passValid && confimPassValid){
   
        $registerBtn.addClass("enabled").prop("disabled", false);
        
    }else{
        $registerBtn.removeClass("enabled").prop("disabled", true);
    }
}
