Movie.destroy_all

movies = Movie.create([
  {title: "enthusiastically cloudify covalent scenarios",release_date:"2012", mpaa_rating: "R", description: "My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too."},
  {title: "authoritatively utilize revolutionary catalysts for change",release_date:"2010", mpaa_rating: "R", description: "Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?"},
  {title: "collaboratively engineer seamless best practices",release_date:"2012", mpaa_rating: "PG13", description: "Do you see any Teletubbies in here? Do you see a slender plastic tag clipped to my shirt with my name printed on it? Do you see a little Asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it?"},
  {title: "professionally embrace parallel technology",release_date:"2011", mpaa_rating: "R", description: " No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb."},
  {title: "15 Truths Your Plastic Surgeon Is Using Against You",release_date:"2013", mpaa_rating: "PG", description: "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks."},
  {title: "Bill O'Reilly's 5 Sexy Options Trading Secrets",release_date:"2015", mpaa_rating: "R", description: "Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water."},
  {title: "20 Horrible Things That Make Psychiatrists Feel Sexually Confused",release_date:"2014", mpaa_rating: "NR", description: "You think water moves fast? You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out."}
])

movies[0].reviews << Review.create(body:"The 1994 Chardonnay from Bob's Winery blends absurd sage overtones with a toasty albuterol aroma.", author: 'Adalberto (three toes) Alan', rating: "5")
movies[1].reviews << Review.create(body:"A soapy boysenberry aftertaste and torrid spearmint elements are binded in the 2010 Syrah from De Carro Bros Vineyards.", author: 'Knuckles Rodney', rating: "4")
movies[2].reviews << Review.create(body:"Palm Creek Vineyards unites better-than-slow-death cheeseburger flavors and a rough cherry bouquet in their 2000 Pinot Grigio.", author: 'Triclops', rating: "5")
movies[3].reviews << Review.create(body:"A non-toxic mealy flavor and ashy velvet undertones are entangled in the 1992 Cabernet Sauvignon from Chateau Merde.", author: 'Adam Bloodgood', rating: "1")
movies[4].reviews << Review.create(body:"The 2001 Bordeaux from Alkie Winery combines delightful gingerbread essences with a wookie-proof oatmeal essence.", author: 'Peregrin Tinyfoot', rating: "2")
movies[5].reviews << Review.create(body:"Champs de Martine brings together cantankerous white pepper midtones and a hard-to-miss rum perfume in their 2005 Semillon.", author: 'The Limping Swordsman', rating: "3")
