class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy, :pay, :confirm, :done]

  require 'payjp'

  def index
    @items = Item.includes(:user)
    
  end

  def new
    @item = Item.new
    @item.images.new
    @items = Item.includes(:images).order('created_at DESC')
    @category_parent_array = Category.roots.pluck(:name)
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
		  redirect_to root_path
	  else
	    redirect_to new_item_path  #itemをセーブできなかった時
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    @category_parent_array = Category.roots
    @category_child_array = @item.category.parent.parent.children
    @category_grandchildren2 = @item.category.parent.children
    @category_child = @item.category.parent
    @category_parent = @item.category.root

  end

  def update
    # binding.pry

    if @item.update(item_params)
      # binding.pry
		  redirect_to root_path
	  else
      redirect_to new_item_path  #itemをセーブできなかった時
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def confirm
    card = Card.find_by(user_id: current_user.id)
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end


  def search
      @items_simple = Item.search(params[:keyword])
      @q = Item.ransack(params[:q])
      @search_item = Item.ransack(params[:q]) 
      @items = @search_item.result
  end

  def done
    @images = Image.where(item_id: @item.id)
  end


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    # find_byの検索においてnameとancestryで検索している理由は、parent_nameが複数あったときのための保険
    #parent_nameはJSから取ってきている
  end


  def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
  end



  def get_delivery_method
    
  end


  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
    @item.update(buyer_id: current_user.id)
  redirect_to action: 'done' #完了画面に移動
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :condition, :ship_charge, :ship_area, :ship_date, :ship_method, :category_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id).merge(category_id: params[:category_id]).merge(saler_id: current_user.id)
    
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_ransack
    @q = Item.ransack(params[:q])
  end

end

