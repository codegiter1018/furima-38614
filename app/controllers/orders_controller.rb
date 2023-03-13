class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]
  
  def index
      @item_order = ItemOrder.new
 
  end


  def create
   
    @item_order = ItemOrder.new(order_params)
  
 
    if @item_order.valid?
   pay_item
   binding.pry
      @item_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
  
  def order_params
    params.require(:item_order).permit(:postcode, :prefecture_id, :municipalities, :address, :buildingname, :telephonenumber ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    Payjp::Charge.create(
      amount: @item.price,        
      card: order_params[:token], 
      currency: 'jpy'             
    )
  end



end
