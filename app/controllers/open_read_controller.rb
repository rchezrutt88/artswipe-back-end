#
class OpenReadController < ProtectedController
  READ_ACTIONS = [:index, :show, :random].freeze
  skip_before_action :authenticate, only: READ_ACTIONS
  before_action :set_current_user, only: READ_ACTIONS
end
