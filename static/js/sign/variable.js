$(document).ready(function () {
    window.$userInput = $('#username');
    window.$otpInput = $('#code');
    window.$otpBtn = $('#otp_btn');
    window.$password = $('#password');
    window.$confirmPassword = $('#confirm_password');
    window.$termsCheckbox = $("#terms_checkbox");

    window.$errorMessage = $('.error-username');
    window.$errorPassword = $('.password_error');
    window.$confirmError = $('.confirm_error');

    window.countdown = 160;
    window.userValid = false;
    window.userCodeValid = false;
    window.confirmTerms = false;
    window.passValid = false;
    window.confimPassValid = false;
    window.otp = null;
    window.codeExpires = false;

    window.$registerBtn =$('.register_btn');

    window.$otpBtn.prop("disabled", false);
});
