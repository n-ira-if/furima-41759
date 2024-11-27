class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_out, only: [:edit]

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
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless current_user == @item.user
      redirect_to root_path
    end
    @item.destroy
    redirect_to root_path
  end



  private


  def item_params
    params.require(:item).permit(:name, :concept, :category_id, :situation_id, :shippingfee_id, :region_id, :arrival_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out
    if Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
