# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sub.destroy_all

user = User.create!(username: 'Princess Peach', password: 'ilovemario')
User.create!(username: 'Mario', password: 'ilovepeach')
User.create!(username: 'Luigi', password: 'thethirdwheel')
User.create!(username: 'Yoshi', password: 'mansbestfriend')
Sub.create!(title: "SubTitile1", description: "Mario Brothers For Life", bans:User.first)
Sub.create!(title: "SubTitile2", description: "Mario Brothers For Life - N64", moderator: User.second.id)
Sub.create!(title: "SubTitile3", description: "Peach is Good Too", moderator: User.third.id)