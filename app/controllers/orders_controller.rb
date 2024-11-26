class OrdersController < ApplicationController
  before_action :set_item, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.varid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end






  private

  def order_form_params
    params.require(:order_form).permit(:post_code, :minicipalities, :street_address, :telephone_number, :item_id, :region_id, :building_name).merge(token: params[:token], user: user_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item 
   @item = Item.find(params[:item_id])
  end

end
