var Tmdb = Tmdb || {
  tUrl: 'http://api.themoviedb.org/3/movie/',
  key: '?api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000'
};

$(document).ready(function(){
  Tmdb.getMovie(550);
});

Tmdb.getMovie = function(n){
  $.ajax({
    url: Tmdb.tUrl + n + Tmdb.key,
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
}

Tmdb.getMoviesFromRails = function(){
  $.ajax({
    url: Tmdb.rUrl + '/movies',
    type: 'GET',
  }).done(function(data){
    console.log(data);
  }).fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });
};

Tmdb.indexMovies = function(movies){
  movies.forEach(Tmdb.renderMovie);
};

Tmdb.renderMovie = function(currentVal){
  var html = '<article>';
  html += '<h1 class="post-title">' + currentVal.title + '</h1>';
  html += '<p class="post-body">' + currentVal.body + '</p>';
  html += '<small class="post-author">' + currentVal.author + '</small>';
  html += '<p>Comments: ' + currentVal.comments.length + '</p>';
  html += '</article>';

  $('section.main-content').append(html);
};

Tmdb.submitMovie = function(){
  if(event.preventDefault) event.preventDefault();
  $.ajax({
    url: Tmdb.rUrl + '/movies',
    type: 'POST',
    data: { movie: {
              tmdb_id: $('input#post-title').val(),
         }
      }
  }).done(function(data){
    trace(data);
  }).fail(function(jqXHR, textStatus, errorThrown){
    trace(jqXHR, textStatus, errorThrown);
  });
};
