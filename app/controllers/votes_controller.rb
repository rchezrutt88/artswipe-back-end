class VotesController < ProtectedController
  before_action :set_vote, only: [:update, :destroy]
  before_action :set_art, only: [:create, :index, :show]

  # TODO: should not get all votes, but votes on given art
  # GET /votes
  # GET /votes.json
  def index
    @votes = @art.votes.all


    render json: @votes
  end

  # GET /votes/1
  # GET /votes/1.json
  #
  def show

    if params[:id] == 'user'
      @vote = @art.votes.where(user_id: current_user.id)
    end
    render json: @vote
  end

  # POST /votes
  # POST /votes.json

  # FIXME
  def create
    # @vote = @art.votes.build(vote_params)
    # # Why does this not need to be a reference to current_user.id
    # @vote.user = current_user

    @vote = current_user.votes.build(vote_params)
    @vote.art = @art

    # # XXX
    # @art.votes = @vote;

    if @vote.save
      render json: @vote, status: :created
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # # XXX
  # # TODO make this more secure by removing user_id arg?
  # def uservoteonart
  #   @vote = @art.votes(user_id: current_user.id)
  #   render json: @vote
  # end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    if @vote.update(vote_params)

    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy

    head :no_content
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_art
    @art = Art.find(params[:art_id])
  end

  def vote_params
    params.require(:vote).permit(:liked)
  end
end
