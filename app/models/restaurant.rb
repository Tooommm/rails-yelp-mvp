class Restaurant < ApplicationRecord
  CATEGORY = ['Chinese', 'Italian', 'Japanese', 'French', 'Belgian']
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORY,
    message: "%{value} is not a valid category"
  }
end
  # belongs_to :user
  # validates :user, :url, presence: true
  # validates :title, presence: true, length: { minimum: 5 }
  # validates :title, uniqueness: { case_sensitive: false }
  # validates :url, format: URI::regexp(%w[http https])
