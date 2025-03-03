function submitForm(){
    
    let username = $userInput.val().trim();
    let password = $password.val().trim();

    console.log(username, password + "BY checkInputs")

    $.ajax({
        url:"/api/signup",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({
            username: username,
            password: password
        }),
        success: function(response){
            
            alert("Success")
            console.log("Server Response:", response); 
        },
        error: function(xhr){
           
        }
    })
}