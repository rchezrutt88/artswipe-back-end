class Art < ActiveRecord::Base
  acts_as_voteable
  validates_uniqueness_of :url

  scope :female, -> { where(gender: 'FEMALE') }
  scope :male, -> { where(gender: 'MALE') }

  scope :random, -> { order("RANDOM()").first }

  scope :art_i_like, -> (current_user){
     joins(:votes).where(votes: {voter_id: current_user, vote: true})
    #  art_ids = user_votes.map { |e| e.voteable_id }
    #  something = Votes.first
   }

   scope :art_i_dislike, -> (current_user){
     joins(:votes).where(votes: {voter_id: 4, vote: false})
   }

  # def self.art_i_like
  #   # Change "votes" to "votes_by" if you've configured ThumbsUp.configuration.voter_relationship_name
  #   self.where(:id => self.votes.where(:voteable_type => 'Art').where(:vote => true).map(&:voteable_id))
  #   # Art.tally.where('votes.voter_id' => current_user.id).where('voteable_type' => 'Art')
  # end


end
