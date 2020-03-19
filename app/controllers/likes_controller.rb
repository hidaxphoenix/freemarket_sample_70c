class LikesController < ApplicationController

  before_action :get_item

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    @likes = Like.where(item_id: params[:item_id])
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    @likes = Like.where(item_id: params[:item_id])
  end
  
  def get_item
    @item = Item.find_by(params[:item_id])
  end

  # def create
  #   @like = current_user.likes.create(item_id: params[:item_id])
  #   redirect_back(fallback_location: root_path)
  # end

  # def destroy
  #   @like = Like.find_by(item_id: params[:id], user_id: current_user.id)
  #   # binding.pry
  #   @like.destroy
  #   redirect_back(fallback_location: root_path)
  # end
end
