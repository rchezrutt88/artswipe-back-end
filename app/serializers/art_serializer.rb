class ArtSerializer < ActiveModel::Serializer
  attributes :id, :author, :born_died, :title, :date, :technique, :location, :url, :form, :style, :school, :timeframe
  has_many :votes
  has_one :my_vote

  private

  def my_vote
    Vote.find_by(voteable_id: object.id, voter_id: scope.id)
  end

end
