var Search = Search || {
  tUrl: 'http://api.themoviedb.org/3/',
  key: '&api_key=c688559a6fc49e17efa91cf8b357837f',
  rUrl: 'http://localhost:3000'
};


$(document).ready(function(){

Search.getSearchString();

});

Search.getSearchString = function(){
   $('#movie-query-submit').click(function(){
      searchString = $('#movie-query-input').val();
      Search.compareSearch(searchString);
  });
};

Search.compareSearch = function(searchString){
  if (event.preventDefault) event.preventDefault();
  $.ajax({
    url: Search.tUrl + 'search/movie?query=' + searchString + Search.key,
    type: 'GET',
  }).done(function(data){
    Search.render(data)
  })
  .fail(function(jqXHR, textStatus, errorThrown){
    console.log(jqXHR, textStatus, errorThrown);
  });

};

Search.render = function(data){
   var templateS = Handlebars.compile($('#results').html());
   console.log(data);
  $('#search-results').html(templateS({
    results: data.results
  }));

};

