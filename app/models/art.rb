class Art < ActiveRecord::Base
  acts_as_voteable
  validates_uniqueness_of :url

  scope :female, -> { where(gender: 'FEMALE') }
  scope :male, -> { where(gender: 'MALE') }

  # write scopes to ensure random returns no-voted on art first?
  scope :random, -> { order('RANDOM()').first }

  scope :art_i_like, lambda { |current_user|
                       joins(:votes).where(votes: { voter_id: current_user, vote: true })
                     }

  scope :art_i_dislike, lambda { |current_user|
    joins(:votes).where(votes: { voter_id: current_user, vote: false })
  }

end
