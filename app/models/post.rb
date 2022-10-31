class Post < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :review_title, presence: true
 # validates :evaluation, presence: true
  validates :background, presence: true

  def favorited_by?(customer)
   favorites.exists?(customer_id: customer.id).exists?
  end

end