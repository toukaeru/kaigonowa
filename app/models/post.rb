class Post < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # 通知
  has_many :notifications, dependent: :destroy
  belongs_to :customer
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true

  scope :search_by_keyword, -> (keyword) { where("title LIKE ?", "%#{keyword}%") }

  def liked_by?(customer)
    likes&.exists?(customer_id: customer.id) if customer.present? && likes.present?
  end

end
