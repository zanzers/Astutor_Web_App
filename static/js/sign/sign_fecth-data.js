$(document).ready(function() {  
    $('#sign-form').on("submit", function(e) {
        e.preventDefault();

            let signForm = {
            username: $userInput.val().trim(),
            password: $password.val().trim(),
        };
        console.log("Sending Signup request...");
    
        $.ajax({
            method: "POST",
            url: "/api/signup",
            contentType: "application/json",
            data: JSON.stringify(signForm),
            dataType: "json",
            success: function(response){
                console.log("Response received:", response);
    
                if(response.success){
                    alert("Sign successful");
                    clearSignupForm();
                    window.location.href = response.redirect_url
                }

    
            }
        })
    })
  
    function clearSignupForm() {
        $("#username").val("");
        $("#code").val("");
        $("#password").val("");
        $("#confirm_password").val("");

    }
    
})