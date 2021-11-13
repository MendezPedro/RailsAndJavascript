# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Urlmark.destroy_all
TypeFormat.destroy_all

#Faker::TvShows::Simpsons.quote

type_format = ["bebida alcoholica", "bebida fantasia"]

type_format.each do |type_format|
    TypeFormat.create(
        name: type_format
        )
end