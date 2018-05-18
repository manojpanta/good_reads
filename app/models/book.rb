class Book < ApplicationRecord
  validates :title, presence: true
  has_many :reviews
  has_many :ratings

  def self.average_rating

  end

end
