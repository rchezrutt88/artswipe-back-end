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
require 'pry'

art_path = 'data/arts.csv'
user_path = 'data/users.csv'
vote_path = 'data/votes.csv'

def populate_arts(path)
  Art.transaction do
    CSV.foreach(Rails.root + path, encoding: "ISO-8859-1:UTF-8", headers: true, header_converters: :downcase) do |art_row|
      art = art_row.to_hash
      Art.find_or_create_by!(art)
    end
  end
end

def populate_users(path)
  User.transaction do
    CSV.foreach(Rails.root + path, headers: true) do |user_row|
      user = user_row.to_hash
      # binding.pry
      search_user = user.reject { |k, _v| k == 'password' }
      next if User.exists? search_user
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

populate_users(user_path)
