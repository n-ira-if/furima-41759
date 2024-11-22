class HomesController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new
    end
    
  end


  private


  def item_params
    params.require(:item).permit(:name, :concept, :category_id, :situation_id, :shippingfee_id, :region_id, :arrival_id, :price, :image).merge(user_id: current_user.id)
  end

end
