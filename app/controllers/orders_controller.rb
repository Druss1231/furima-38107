class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new

  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
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
     Payjp.api_key = "sk_test_335767f24877c75b10037f7e"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
     Payjp::Charge.create(
       amount: @item.price,  # 商品の値段
       card: order_params[:token],    # カードトークン
       currency: 'jpy'                 # 通貨の種類（日本円）
     )
   end

end