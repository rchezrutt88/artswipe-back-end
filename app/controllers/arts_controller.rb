class ArtsController < OpenReadController
  before_action :set_art, except: [:index, :random]
  before_action :set_vote, only: [:toggle_vote]

  def index
    @arts = Art.all

    render json: @arts
  end

  def show
    render json: @art
  end

  def random
    @art = Art.offset(rand(Art.count)).first

    render json: @art
  end

  #create action
  def up_vote
    current_user.vote_for(@art)

    set_vote

    render json: @vote
  end

  #create action
  def down_vote
    current_user.vote_against(@art)

    set_vote

    render json: @vote
  end

  def toggle_vote #update
    patch_vote = cast_bool(params[:patchVote])

    @vote.update(vote: patch_vote)

    render json: @vote
  end

  def clear_vote #delete
    current_user.unvote_for(@art)
  end


  private

  def set_art
    @art = Art.find(params[:id])
  end

  def set_vote
    @vote = Vote.find_by(voteable_id: params[:id], voter_id: current_user.id)
  end

  def cast_bool(str)
    str == 'true'
  end

  def art_params
    params.require(:art).permit(:author, :born_died, :title, :date, :technique, :location, :url, :form, :style, :school, :timeframe)
  end

end
