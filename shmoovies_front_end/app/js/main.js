var Reg = Reg || {};



Reg.submitRegistration = function(event) {
  event.preventDefault();
  $.ajax({
    url: 'http://localhost:3000/users',
    type: 'POST',
    data: {user: {email: $('#email').val(), password: $('#password').val()}},
    })
    .done(Reg.loginSuccess)
    .fail(function(err) {
      console.log(err);
    });

  };

Reg.loginSuccess = function(userData) {

  localStorage.setItem('authToken', userData.token);
  console.log('logged in!');
  debugger;

  history.back();
};

Reg.submitLogin = function(event) {

  event.preventDefault();
    $.ajax({
      url: 'http://localhost:3000/users/sign_in',
      type: 'POST',
      data: {email: $('#email').val(), password: $('#password').val()},
    })
    .done(Reg.loginSuccess)
    .fail(function(err) {
      console.log(err);
    });

    return false;
  };

  Reg.setupAjaxRequests = function() {
    $.ajaxPrefilter(function( options ) {
      options.headers = {};
      options.headers['AUTHORIZATION'] = "Token token=" + authToken;
    });
  };

$(document).ready(function(){

  $('#sign_in').on('click', function(){
    Reg.submitLogin(event);
  });

  $('#sign_up').on('click', function(){
    Reg.submitRegistration(event);
  });

});
