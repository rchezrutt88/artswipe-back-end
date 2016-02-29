# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

require 'csv'

art_path = 'data/arts.csv'
user_path = 'data/users.csv'
vote_path = 'data/votes.csv'

def populate_arts(path)
  Art.transaction do
    CSV.foreach(Rails.root + path, headers: true, col_sep: ';', header_converters: :downcase) do |art_row|
      art = art_row.to_hash
      next if Art.exists? art
      Art.create!(art)
    end
  end
end

def populate_users(path)
  User.transaction do
    CSV.foreach(Rails.root + path, headers: true) do |user_row|
      user = user_row.to_hash
      next if User.exists? user
      User.create!(user)
    end
  end
end

def populate_votes(path)
  Vote.transaction do
    CSV.foreach(Rails.root + path, headers: true) do |vote_row|
      vote = vote_row.to_hash
      next if Vote.exists? vote
      Vote.create!(vote)
    end
  end
end


populate_arts(art_path)

# populate_users(user_path)




# namespace :db do
#   namespace :populate do
#     desc 'Fill the database with example data'
#     task all: [:users, :arts, :votes]
#
#     desc 'Fill the people table with example data'
#     task people: :environment do
#       Person.transaction do
#         CSV.foreach(Rails.root + 'data/people.csv',
#                     headers: true) do |person_row|
#           person = person_row.to_hash
#           next if Person.exists? person
#           Person.create!(person)
#         end
#       end
#     end
#
#     desc 'Fill the cities table with example data'
#     task cities: :environment do
#       City.transaction do
#         CSV.foreach(Rails.root + 'data/cities.csv',
#                     headers: true) do |city_row|
#           city = city_row.to_hash
#           next if City.exists? city
#           City.create!(city)
#         end
#       end
#     end
#
#     desc 'Fill the pets table with example data'
#     task pets: :environment do
#       Pet.transaction do
#         CSV.foreach(Rails.root + 'data/pets.csv',
#                     headers: true) do |pet_row|
#           pet = pet_row.to_hash
#           next if Pet.exists? pet
#           Pet.create!(pet)
#         end
#       end
#     end
#   end
# end
