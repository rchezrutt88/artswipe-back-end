class VoteSerializer < ActiveModel::Serializer
  attributes :id, :voter_id, :voteable_id, :vote
end
