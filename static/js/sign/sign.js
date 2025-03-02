
function google() {
    alert("This feature is under development.");
}

$(document).ready(function() {
    const $inputs = $('.input_field');  
  
    $(".input_field").on("input", function() {
        let hasText = $(this).val().trim() !== "";
        $(this).siblings(".clear_btn").toggle(hasText);
    });

    $(document).on("click", ".clear_btn", function() {
        $(this).siblings(".input_field").val("").blur();
        $(this).hide();
    });

    $inputs.on("input", checkInputs); 
});



$(document).ready(function () {

    $('.toggle_pass').hide();

    $('.input_field').on("input", function () {

        let $field = $(this);
        let $toggleIcon = $field.siblings(".toggle_pass");

        if($field.val().length > 0){
            $toggleIcon.show();
        }else {
            $toggleIcon.hide();
        }
    });

    $('.toggle_pass').on('click', function () {
        let $toggleIcon = $(this);
        let $passwordField = $toggleIcon.siblings("input");
        let isPassword = $passwordField.attr("type") === "password";

        $passwordField.attr("type", isPassword ? "text" : "password");

        let newSrc = isPassword ? "/static/asset/show.svg" : "/static/asset/hide.svg";
        $toggleIcon.attr("src", newSrc);
    });
});
