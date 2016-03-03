# README

## Models and Relations
-  Users
  - has_many: arts, votes
- Art
  - has_many: votes
- Vote
  - belongs_to: art, user

## Custom Routes
- ```GET arts/random```: returns a random piece of art from the database.
