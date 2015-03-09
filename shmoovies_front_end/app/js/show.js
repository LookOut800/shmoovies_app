var Tmdb = Tmdb || {
  tUrl: 'http://api.themoviedb.org/3/movie/',
  key: '?api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000',
  movieId: ''
};



$(document).ready(function(){
  var locate = window.location.search
  locate = locate.substring(1, locate.length);
  authToken = localStorage.getItem('authToken');

  Tmdb.getMovieShow(locate);
  Tmdb.getReviews(locate);


  $('#review-submit').on('click', 'button', function(){
    Tmdb.submitMovie(locate);
    location.reload();
  });

  $('#submit').on('click', function(){
    Tmdb.submitReview();
    location.reload();
  });

});

Tmdb.getMovieShow = function(num){
  $.ajax({
    url: Tmdb.tUrl + num + Tmdb.key,
    type: 'GET',
  }).done(Tmdb.renderShow)
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};

Tmdb.getReviews = function(num){
  $.ajax({
    url: Tmdb.rUrl + '/movies/' + num,
    type: 'GET',
  }).done(function(data){
    Tmdb.reviewLogic(data);
  })
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};
Tmdb.reviewLogic = function(data){

  if (data == false) {
    Tmdb.renderSubmit();
  } else {
    Tmdb.movieId = data[0].id;
    Tmdb.renderReviews(data);
  };
};

Tmdb.acceptFailure = function(error) {
    // If things are failing, deal with specific errors
    // If status is unauthorized, then redirect to a login route/page
    if (error.status === 401) {
      console.log('SEND TO LOGIN SCREEN');
      window.location.href = '/sign_in.html';
    }
  };
Tmdb.renderShow = function(data){
  var template = Handlebars.compile($('#movie-info').html());
  $('#show-content').html(template({
    movie: data
  }));
};

Tmdb.renderReviews = function(data){
  var template = Handlebars.compile($('#review-info').html());
  $('#show-reviews').html(template({
    movie: data[0]
  }));
};

Tmdb.renderSubmit = function(){
  var html = '<h2>Is this your movie?</h2>';
  html += '<button id="post-movie">Confirm</button>'
  $('#review-submit').html(html);
};


Tmdb.submitMovie = function(data){
  if(event.preventDefault) event.preventDefault();

  $.ajax({
    url: Tmdb.rUrl + '/movies',
    type: 'POST',
    data: { movie: {
              tmbd_id: data
         }
      }
  }).done(function(data){
    console.log(data);
  }).fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};

Tmdb.submitReview = function(){
  if(event.preventDefault) event.preventDefault();
  $.ajax({
    url: Tmdb.rUrl + '/movies/' + Tmdb.movieId + '/reviews',
    type: 'POST',
    data: { review: {
              body: $('#newReview').val(),
              author: $('#reviewAuthor').val()
         }
      }
  }).done(function(data){
    console.log(data);
  })
  .fail(Tmdb.acceptFailure);
};

