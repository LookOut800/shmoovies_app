var Tmdb = Tmdb || {};


Tmdb.getMovieShow = function(movie){
  $.ajax({
    url: Tmdb.tUrl + movie.tmbd_id + Tmdb.key,
    type: 'GET',
  }).done(Tmdb.renderShow)
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};

Tmdb.renderShow = function(data){
  var template = Handlebars.compile($('#movie-show').html());
  $('#content').html(template({
    movie: data
  }));
};


Tmdb.submitMovie = function(){
  if(event.preventDefault) event.preventDefault();
  $.ajax({
    url: Tmdb.rUrl + '/movies',
    type: 'POST',
    data: { movie: {
              tmbd_id:,
         }
      }
  }).done(function(data){
    trace(data);
  }).fail(function(jqXHR, textStatus, errorThrown){
    trace(jqXHR, textStatus, errorThrown);
  });
};
