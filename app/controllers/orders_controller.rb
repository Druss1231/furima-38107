class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.order.present? || current_user.id == @item.user_id || !user_signed_in?
    @order_destination = OrderDestination.new
  end

  def new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index 
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :from_id, :city, :address_line, :building, :phone).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

   def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
     Payjp::Charge.create(
       amount: @item.price,  # 商品の値段
       card: order_params[:token],    # カードトークン
       currency: 'jpy'                 # 通貨の種類（日本円）
     )
   end

   def set_item
    @item = Item.find(params[:item_id])
   end

end