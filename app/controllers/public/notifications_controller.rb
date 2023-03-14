class Public::NotificationsController < ApplicationController
  after_action :read_notification, only: :index
  def index
    	@notifications = current_customer.passive_notifications.where(checked: false)
  end

  	private
  	def read_notification
  	  current_customer.passive_notifications.where(checked: false).update_all(checked: true)
  	end
end
