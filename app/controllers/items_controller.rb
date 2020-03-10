class ItemsController < ApplicationController
  def index
  end

  def new
    
    @item = Item.new
    @item.images.new
    @parents = Category.where(ancestry: nil)
   
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
		  redirect_to root_path
	  else
	    redirect_to new_item_path  #itemをセーブできなかった時
    end
    # binding.pry
    
  end

  def show

  end

  def confirm

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :ship_charge, :ship_area, :ship_date, :ship_method, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)
    
  end
end

