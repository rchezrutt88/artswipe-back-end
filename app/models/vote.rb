class Vote < ActiveRecord::Base
  belongs_to :art
  belongs_to :user
end
