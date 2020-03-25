class LikesController < ApplicationController

  before_action :get_item

  def like
    like = current_user.likes.new(item_id: @item.id)
    like.save
  end
  
  def unlike
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy
  end
  
  private
  def get_item
    @item = Item.find(params[:item_id])
    @id_name = "#like-link-#{@item.id}"
  end

end
