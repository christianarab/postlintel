# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Make users
[
  ["tony@example.com", 'password'],
  ["erika@example.com", 'password'],
  ["dawn@example.com", 'password'],
  ["john@example.com", 'password'],
].each_with_index do |email, password, index|
  User.create(email: email, password: password, created_at: DateTime.now - (rand * 21), updated_at: DateTime.now - (rand * 21)).save!(validate: false)
  Profile.create(tagline: "Edit your tagline", interests: "Edit your interests", user_id: index)
end
