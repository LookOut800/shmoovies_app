Movie.destroy_all

movies = Movie.create([
  {title: "title 1",release_date:"2012", mpaa_rating: "R", description: "description 1"},
  {title: "title 2",release_date:"2010", mpaa_rating: "R", description: "description 2"},
  {title: "title 3",release_date:"2012", mpaa_rating: "PG13", description: "description 3"},
  {title: "title 4",release_date:"2011", mpaa_rating: "R", description: "description 4"},
  {title: "title 5",release_date:"2013", mpaa_rating: "PG", description: "description 5"},
  {title: "title 6",release_date:"2015", mpaa_rating: "R", description: "description 6"},
  {title: "title 7",release_date:"2014", mpaa_rating: "NR", description: "description 7"}
])

movies[0].reviews << Review.create(body:"Review body 1", author: 'Person1', rating: "5")
movies[1].reviews << Review.create(body:"Review body 2", author: 'Person2', rating: "4")
movies[2].reviews << Review.create(body:"Review body 3", author: 'Person3', rating: "5")
movies[3].reviews << Review.create(body:"Review body 4", author: 'Person4', rating: "1")
movies[4].reviews << Review.create(body:"Review body 5", author: 'Person5', rating: "2")
movies[5].reviews << Review.create(body:"Review body 6", author: 'Person6', rating: "3")
