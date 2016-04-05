class Art < ActiveRecord::Base
  acts_as_voteable

  scope :female, -> { where(gender: 'FEMALE') }
  scope :male, -> { where(gender: 'MALE') }

  scope :random, -> { order("RANDOM()").first }

end
