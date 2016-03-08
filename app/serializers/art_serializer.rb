class ArtSerializer < ActiveModel::Serializer
  attributes :id
  has_many :votes
end
