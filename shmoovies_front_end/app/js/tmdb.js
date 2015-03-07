var deferreds = $.Deffered;
var deferreds = [];

var Tmdb = Tmdb || {
  tUrl: 'http://api.themoviedb.org/3/movie/',
  key: '?api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000'
};

$(document).ready(function(){
  Tmdb.getMoviesFromRails();
});

Tmdb.getMovie = function(movie){
  $.ajax({
    url: Tmdb.tUrl + movie.tmbd_id + Tmdb.key,
    type: 'GET',
  }).done(function(data){
    def = data;
    deferreds.push(def);
    console.log(deferreds)
  })
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};

var proveIt = function(){
  console.log(deferreds);
};

Tmdb.moviesIndex = function(data){
    setTimeout(Tmdb.renderSlider, 700);
    data.forEach(Tmdb.getMovie);
};


// Tmdb.renderShow = function(data){
//   var template = Handlebars.compile($('#movie-show').html());
//   $('#content').html(template({
//     movie: data
//   }));
// };

Tmdb.renderSlider = function(){

  var template = Handlebars.compile($('#movie-show').html());
  $('#content').html(template({

    movies: deferreds
  }));
};

Tmdb.getMoviesFromRails = function(){
  $.ajax({
    url: Tmdb.rUrl + '/movies',
    type: 'GET',
  }).done(function(data){
    // console.log(data);
    Tmdb.moviesIndex(data);
  })
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};

// Tmdb.submitMovie = function(){
//   if(event.preventDefault) event.preventDefault();
//   $.ajax({
//     url: Tmdb.rUrl + '/movies',
//     type: 'POST',
//     data: { movie: {
//               XXXXXXXXXXXXXXXXXXXXXXXXX,
//          }
//       }
//   }).done(function(data){
//     trace(data);
//   }).fail(function(jqXHR, textStatus, errorThrown){
//     trace(jqXHR, textStatus, errorThrown);
//   });
// };
