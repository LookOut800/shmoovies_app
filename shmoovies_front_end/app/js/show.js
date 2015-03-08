var Tmdb = Tmdb || {
  tUrl: 'http://api.themoviedb.org/3/movie/',
  key: '?api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000'
};



$(document).ready(function(){
  var locate = window.location.search
  locate = locate.substring(1, locate.length);

  Tmdb.getMovieShow(locate);
  Tmdb.getReviews(locate);
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
    dataType: 'JSON'
  }).done(Tmdb.renderReviews)
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
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


Tmdb.submitMovie = function(){
  if(event.preventDefault) event.preventDefault();
  $.ajax({
    url: Tmdb.rUrl + '/movies',
    type: 'POST',
    data: { movie: {
              tmbd_id: locate
         }
      }
  }).done(function(data){
    trace(data);
  }).fail(function(jqXHR, textStatus, errorThrown){
    trace(jqXHR, textStatus, errorThrown);
  });
};
