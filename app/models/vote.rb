class Vote < ActiveRecord::Base
  belongs_to :art, inverse_of: :votes
  belongs_to :user, inverse_of: :votes

  validates_uniqueness_of :user_id, scope: :art_id 
end
