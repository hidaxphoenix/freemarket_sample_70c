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

end
