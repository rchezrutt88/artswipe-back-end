class ArtSerializer < ActiveModel::Serializer
  attributes
   :id,
   :author,
   :born_died,
   :title,
   :date,
   :technique,
   :location,
   :url,
   :form,
   :style,
   :school,
   :timeframe,
   :get_votes


  has_many :votes

  # TODO add serializer that returns all votes!

private

  def get_votes
    Vote.where(art_id: id)
  end


end
