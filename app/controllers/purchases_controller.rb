class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :item_find

  def index
    @purchase_address = PurchaseAddress.new
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
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :block, :build, :phone_number).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end