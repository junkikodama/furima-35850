class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, :soldout, :self_purchase

  def index
    @purchase_address = PurchaseAddress.new
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :block, :build, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def soldout
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def self_purchase
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end