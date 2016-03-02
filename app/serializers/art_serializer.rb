class ArtSerializer < ActiveModel::Serializer
  attributes :id,
  :author,
  :born_died,
  :title, :date, :technique, :location, :url, :form,
  :style, :school, :timeframe, :my_vote

  has_many :votes

# FIXME This doesn't work.
  def my_vote
    # puts scope
    # puts scope.token == 'f7e4eda822adf32b1b676f1813b19c5a'
    # puts scope.id

    Vote.find_by(art_id: id, user_id: scope.id)
  end

end



# scope.
