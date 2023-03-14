class Notification < ApplicationRecord
  default_scope->{order(created_at: :desc)}

	belongs_to :post, optional: true
  belongs_to :comment, optional: true

  # 通知
  belongs_to :visiter, class_name: 'customer', foreign_key: 'visiter_id', optional: true
	belongs_to :visited, class_name: 'customer', foreign_key: 'visited_id', optional: true
end
