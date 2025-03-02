$(document).ready(function(){
    
    $userInput.on("blur input", validateEmail);
    $otpBtn.on("click", generateCode);
    $password.on("input", validatePassword);
    $confirmPassword.on("input", validateConfirmPassword);
    $termsCheckbox.on("click", validateTerms);
    $registerBtn.on("click", submitForm);

});