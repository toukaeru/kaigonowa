class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :customer
  belongs_to :category

  scope :search_by_keyword, -> (keyword) { where("title LIKE ?", "%#{keyword}%") }

  def liked_by?(customer)
    likes&.exists?(customer_id: customer.id) if customer.present? && likes.present?
  end

end
