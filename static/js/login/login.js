$(document).ready(function() {
    const $inputs = $('.input_field');  
    const $loginBtn = $('.login_btn'); 




    function checkInputs() {
        
        let username = $("#username").val().trim(); 
        let password = $("#password").val().trim();

        if(username !== "" && password !=="" && password.length >= 6 ){
            $loginBtn.addClass("enabled").prop("disabled", false);
        } else {
            $loginBtn.removeClass("enabled").prop("disabled", true);
        }
    }

    $inputs.on("input", checkInputs); 
    
    $(".input_field").on("input", function() {
        let hasText = $(this).val().trim() !== "";
        $(this).siblings(".clear_btn").toggle(hasText);
    });
    
    $(document).on("click", ".clear_btn", function() {
        $(this).siblings(".input_field").val("").blur();
        $(this).hide();
    });
    let $passwordField = $("#password");
    let $showPass = $(".show_pass");
    let $hidePass = $(".hide_pass");
    
    $showPass.hide();
    $hidePass.hide();
    
    $passwordField.on("input", function () {
        let hasText = $(this).val().length > 0;
        $hidePass.toggle(hasText);
    });
    
    
    $(".toggle_pass").on("click", function () {
        let isPassword = $passwordField.attr("type") === "password";
    
        $passwordField.attr("type", isPassword ? "text" : "password");
    
    
        $showPass.toggle(isPassword);
        $hidePass.toggle(!isPassword);
    });

});



function google() {
    alert("This feature is under development.");
}



