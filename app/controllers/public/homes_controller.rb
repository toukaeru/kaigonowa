class Public::HomesController < ApplicationController
  def top
    @posts = Post.order(created_at: :desc).limit(2)
  end

  def about
  end
end
