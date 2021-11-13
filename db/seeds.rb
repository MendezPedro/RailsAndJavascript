# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Urlmark.destroy_all
Category.destroy_all
TypeFormat.destroy_all

20.times do
    TypeFormat.create(
        title: Faker::TvShows::Simpsons.character
    )
end

6.times do
    Category.create(
        title: Faker::TvShows::Simpsons.location
    )
end

14.times do
    Category.create(
        title: Faker::TvShows::Simpsons.location,
        category_id: Random.rand(1..8)
    )
end

20.times do
    Urlmark.create(
        url: Faker::TvShows::Simpsons.quote,
        category_id: Random.rand(1..20),
        type_format_id: Random.rand(1..20)
    )
end