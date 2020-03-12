class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new

    
    @item = Item.new
    @item.images.new
    @parents = Category.where(ancestry: nil)

    @children = Category.find_by(name: "メンズ")

   
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
		  redirect_to root_path
	  else
	    redirect_to new_item_path  #itemをセーブできなかった時
    end
    

  end

  def show
    @items = Items.find(params[:id])
  end

  def edit
    
  end

  def destroy
    
  end

  def confirm

  end

  def search
    respond_to do |format|
      format.html
      format.json do
      end
    end
  end
  


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :ship_charge, :ship_area, :ship_date, :ship_method, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)
    
  end
end

