var Tmdb = Tmdb || {
  tUrl: 'http://api.themoviedb.org/3/movie/',
  key: '?api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000'
};

var locate = window.location.search
locate = locate.substring(1, locate.length);

$(document).ready(function(){
  Tmdb.getMovieShow(locate);
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

Tmdb.renderShow = function(data){
  var template = Handlebars.compile($('#movie-info').html());
  $('#show-content').html(template({
    movie: data
  }));
};


// Tmdb.submitMovie = function(){
//   if(event.preventDefault) event.preventDefault();
//   $.ajax({
//     url: Tmdb.rUrl + '/movies',
//     type: 'POST',
//     data: { movie: {
//               tmbd_id:,
//          }
//       }
//   }).done(function(data){
//     trace(data);
//   }).fail(function(jqXHR, textStatus, errorThrown){
//     trace(jqXHR, textStatus, errorThrown);
//   });
// };
