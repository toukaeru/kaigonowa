class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  has_many :notifications, dependent: :destroy
  
  validates :comment, presence: true
  
  def create_notification_comment!(visiter, visited_id)
        notification = visiter.active_notifications.new(
          post_id: post_id,
          comment_id: id,
          visited_id: visited_id,
          action: 'comment'
        )
        if notification.visiter_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
  end
end
