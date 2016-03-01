class VoteSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :user, :art, :liked
end
