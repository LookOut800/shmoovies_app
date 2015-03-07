var Search = Search || {
  tUrl: 'http://api.themoviedb.org/3/movie/',
  key: '?api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000'
};



$(document).ready(function(){

Search.getSearchString();

});

Search.getSearchString = function(){

   $('forms.form-group').on('submit', function(event){

   searchString = $('movie-query-input').val();

    Search.compareSearch(searchString);

  });
};


Search.compareSearch = function(event){
  if (event.preventDefault) event.preventDefault();
  $.ajax({
    url: Search.rUrl + '/movies',
    type: 'GET',
  }).done(function(data){
    // console.log(data);
    Search.moviesIndex(data);
  })
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });  

}

