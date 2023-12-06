# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_titre|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'




sapins =[ {
  nom: "epicea",
  image: "https://www.plantezcheznous.com/wp-content/uploads/2017/11/EpiceaCommun.jpg",
  geoloc: "nice"
},
{
  nom: "nordmann",
  image: "https://www.plantezcheznous.com/wp-content/uploads/2017/11/Nordmann.jpg",
  geoloc: "paris"
},
{
nom: "sapin noble",
image: "https://www.plantezcheznous.com/wp-content/uploads/2017/11/SapinNoble.jpg",
geoloc: "marseille"
},
{
nom: "sapin de serbie",
image: "https://www.plantezcheznous.com/wp-content/uploads/2017/11/Picea_omorika.jpg",
geoloc: "bordeaux"
}
]

description = ["Un beau sapin", "Un sapin de noel", "bien grand", "belles branches"]

user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')  # Créez un utilisateur factice
4.times do
  taille = rand(100..500)
  price = rand(10..300)
  sapin = sapins.sample
  tree = Tree.new(
    titre: sapin[:nom],
    taille: taille,
    price: price,
    geoloc: sapin[:geoloc],
    description: description.sample,
    image: sapin[:image],
    user: user
  )
  tree.save!
end

# Tree.create!(
#   titre: 'Light & Spacious Garden Tree London',
#   taille: '10 Clifton Gardens London W9 1DT',
#   price: 'A lovely summer feel for this spacious garden Tree. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
#   geoloc: 75,
#   description: 3,
#   image_url: 'https://prod-saint-gobain-fr.content.saint-gobain.io/sites/saint-gobain.fr/files/2022-04/maison-contemporaine-la-maison-saint-gobain01.jpg'
# )
# Tree.create!(
#   titre: 'Une belle room',
#   taille: 'Avenue de l/cole',
#   price: 'Un bon sejour OKLM',
#   geoloc: 25,
#   description: 2,
#   image_url:'https://www.depreux-construction.com/wp-content/uploads/2022/11/maisons-modernes-modeles-plans-amenagement.jpg'
# )
# Tree.create!(
#   titre: 'La BatRoom',
#   taille: 'Gotham city',
#   price: 'Pour les gens bresom',
#   geoloc: 300,
#   description: 7,
#   image_url:'https://i.ebayimg.com/images/g/SNgAAOSwjh1hr97F/s-l1600.jpg'
# )
# Tree.create!(
#   titre: 'MusicStudio',
#   taille: 'MeloGangx',
#   price: 'RDV Vendredi',
#   geoloc: 1250,
#   description: 2,
#   image_url: "https://p.turbosquid.com/ts-thumb/dS/RRisMD/ZNgsUquN/1/png/1552579740/600x600/fit_q87/7fcfdfa28a8dfa60d936d6d8b32ba5ce7b41fe01/1.jpg"
# )

# if Tree.last&.image_url.present?
#   puts 'Seed exécuté avec succès.'
# else
#   puts "Erreur lors de l'exécution du seed"
# end
