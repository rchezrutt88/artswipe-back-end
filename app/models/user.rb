#
class User < ActiveRecord::Base
  include Authentication

  has_many :votes

end


# TODO
# votes destroyed when user destroyed
