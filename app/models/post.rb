class Post < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :tag

  validates :review_title, presence: true
 # validates :evaluation, presence: true
  validates :background, presence: true

  def favorited_by?(customer)
   favorites.where(customer_id: customer).exists?
  end

  def show_tag_name
   tag = Tag.find(self.tag_id)
   tag.tag_name
  end


end