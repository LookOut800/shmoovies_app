var Reg = Reg || {};

Reg.submitRegistration = function(event) {
  event.preventDefault();

  $.ajax({
    url: apiHost + '/users',
    type: 'POST',
    data: {user: {email: $('#email').val(), password: $('#password').val()}},
    })
    .done(loginSuccess)
    .fail(function(err) {
      console.log(err);
    });

    return false;
  };

Reg.loginSuccess = function(userData) {
  localStorage.setItem('authToken', userData.token);
  console.log('logged in!');
  history.back();
};

Reg.submitLogin = function(event) {
  event.preventDefault();
    $.ajax({
      url: apiHost + '/users/sign_in',
      type: 'POST',
      data: {user: {email: $('').val(), password: $('').val()}},
    })
    .done(loginSuccess)
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
