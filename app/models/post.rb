class Post < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy

  validates :review_title, presence: true
  validates :evaluation, presence: true
  validates :background, presence: true

end
