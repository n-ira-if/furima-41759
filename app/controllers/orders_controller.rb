class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      ActiveRecord::Base.transaction do
        purchase = Purchase.create(purchase_params)
        Destination.create(destination_params.merge(purchase_id: purchase.id))
      end
      redirect_to root_path
    else
      render :index
    end
  end






  private
  def destination_params
    params.require(:order_form).permit(:post_code, :minicipalities, :street_address, :telephone_number, :region_id, :building_name)
  end

  def purchase_params
    { user_id: current_user.id, item_id: @item.id}.merge(token: params[:token])
  end

  def order_form_params
    params.require(:order_form).permit(:post_code, :minicipalities, :street_address, :telephone_number, :item_id, :region_id, :building_name).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end

  def set_item 
   @item = Item.find(params[:item_id])
  end

end
