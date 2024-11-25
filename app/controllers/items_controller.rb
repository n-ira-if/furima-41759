class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.order(created_at: :desc)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item)
    else
      @item = item
      render :edit, status: :unprocessable_entity
    end
  end


  private


  def item_params
    params.require(:item).permit(:name, :concept, :category_id, :situation_id, :shippingfee_id, :region_id, :arrival_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
