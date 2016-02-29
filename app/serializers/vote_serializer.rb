class VoteSerializer < ActiveModel::Serializer
  attributes :id, :art, :user, :liked
end
