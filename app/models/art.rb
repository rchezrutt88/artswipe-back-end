class Art < ActiveRecord::Base
  acts_as_voteable
  validates_uniqueness_of :url, :title

  scope :female, -> { where(gender: 'FEMALE') }
  scope :male, -> { where(gender: 'MALE') }

  scope :random, -> { order("RANDOM()").first }

end
