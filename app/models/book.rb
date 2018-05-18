class Book < ApplicationRecord
  validates :title, presence: true
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def top_rating
    reviews.maximum(:rating)
  end

  def low_rating
    reviews.minimum(:rating)
  end

  def top_review
    reviews.order('rating DESC').first
  end

  def low_review
    reviews.order('rating ASC').first
  end
end
