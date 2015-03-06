Movie.destroy_all

movies = Movie.create([
  {tmbd_id: 1},
  {tmbd_id: 2},
  {tmbd_id: 3},
  {tmbd_id: 4},
  {tmbd_id: 5},
  {tmbd_id: 6}
])

movies[0].reviews << Review.create(body:"The 1994 Chardonnay from Bob's Winery blends absurd sage overtones with a toasty albuterol aroma.", author: 'Adalberto (three toes) Alan', rating: "5")
movies[1].reviews << Review.create(body:"A soapy boysenberry aftertaste and torrid spearmint elements are binded in the 2010 Syrah from De Carro Bros Vineyards.", author: 'Knuckles Rodney', rating: "4")
movies[2].reviews << Review.create(body:"Palm Creek Vineyards unites better-than-slow-death cheeseburger flavors and a rough cherry bouquet in their 2000 Pinot Grigio.", author: 'Triclops', rating: "5")
movies[3].reviews << Review.create(body:"A non-toxic mealy flavor and ashy velvet undertones are entangled in the 1992 Cabernet Sauvignon from Chateau Merde.", author: 'Adam Bloodgood', rating: "1")
movies[4].reviews << Review.create(body:"The 2001 Bordeaux from Alkie Winery combines delightful gingerbread essences with a wookie-proof oatmeal essence.", author: 'Peregrin Tinyfoot', rating: "2")
movies[5].reviews << Review.create(body:"Champs de Martine brings together cantankerous white pepper midtones and a hard-to-miss rum perfume in their 2005 Semillon.", author: 'The Limping Swordsman', rating: "3")
