$(document).ready(function () {
    $("#login-form").on("submit", function (e) {
        e.preventDefault();

        let formData = {
            username: $("#username").val().trim(),
            password: $("#password").val().trim()
        };
        console.log("Sending login request...");

        $.ajax({
            method: "POST",
            url: "/api/login",
            contentType: "application/json",
            data: JSON.stringify(formData),
            dataType: "json",
            success: function (response) {
                console.log("Response received:", response);
                
                if (response.success) {
                    alert("Login successful!");
                    window.location.href = response.redirect_url;
                    clear()
                }
            },
            error: function (xhr) {
                let errorMsg = "An error occurred. Please try again.";
                if (xhr.responseJSON && xhr.responseJSON.error) {
                    errorMsg = xhr.responseJSON.error;
                }
                console.error("AJAX Error:", xhr.responseText);
                $("#username").addClass("error-border-user");
                $(".error_login").text(errorMsg).show();
                clear()
                
            }
        });
    });


    function clear(){
        $("#password").val("").blur(); 
        $('.clear_btn').hide();
        $(".show_pass").hide();
        $(".hide_pass").hide();
    }
    
});


