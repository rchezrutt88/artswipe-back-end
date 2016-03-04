#
class User < ActiveRecord::Base
  include Authentication
  acts_as_voter

end
