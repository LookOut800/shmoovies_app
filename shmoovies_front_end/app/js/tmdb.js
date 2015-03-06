
var movieArray = [];

var Tmdb = Tmdb || {
  tUrl: 'http://api.themoviedb.org/3/movie/',
  key: '?api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000',
  slider: []
};

$(document).ready(function(){
  Tmdb.getMoviesFromRails();
});
/*
Tmdb.getMovie = function(movie){
  $.ajax({
    url: Tmdb.tUrl + movie.tmbd_id + Tmdb.key,
    type: 'GET',
  }).done(function(data){
    Tmdb.slider << data;
  })
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};
*/

Tmdb.moviesIndex = function(data){
  data.forEach(function(currentVal,index,array){
    $.ajax({
        url: Tmdb.tUrl + currentVal.tmbd_id + Tmdb.key,
        type: 'GET',
        success:function(data){
          console.log(data);
          movieArray << data;
        }
      }).done(function(data){
        console.log(data);
        // movieArray << data;
      })
      .fail(function(jqXHR, textStatus, errorThrown){
        console.log(jqXHR, textStatus, errorThrown);
      });
  });
  // Tmdb.renderSlider(Tmdb.slider);
}


/*Tmdb.renderShow = function(data){
  // var template = Handlebars.compile($('#movie-show').html());
  // $('#content').html(template({
  //   movie: data
  // }));
};*/
/*
Tmdb.renderSlider = function(data){
  var template = Handlebars.compile($('#movie-show').html());
  $('#content').html(template({
    movies: data
  }));
};
*/
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
/*
Tmdb.moviesDirect =function(){

}
*/// Tmdb.submitMovie = function(){
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
