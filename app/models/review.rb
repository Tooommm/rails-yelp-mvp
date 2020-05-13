class Review < ApplicationRecord
  RATING = [0,1, 2, 3, 4, 5]

  belongs_to :restaurant
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: RATING,
    message: "%{value} is not a rating"
  }
end
