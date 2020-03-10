class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    @items = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path, notice: '出品が完了しました'
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
end
