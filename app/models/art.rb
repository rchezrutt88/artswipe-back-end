class Art < ActiveRecord::Base
  has_many :votes, inverse_of: :art
end
