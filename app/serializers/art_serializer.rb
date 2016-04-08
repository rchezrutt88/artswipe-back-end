class ArtSerializer < ActiveModel::Serializer
  # TODO remove gender from here, after fixing frontend
  attributes :id, :author, :born_died, :title, :date, :technique, :location, :url, :form, :style, :school, :timeframe, :gender
  has_many :votes
  has_one :my_vote, :face
# IDEA has many faces in future?

  private

  def my_vote
    if scope.nil?
      return nil
    end
    Vote.find_by(voteable_id: object.id, voter_id: scope.id)
  end

  def face
    {gender: object.gender, age_range: object.age_range, height: object.height, width: object.width, positionX: object.positionX, positionY: object.positionY}
  end


end
