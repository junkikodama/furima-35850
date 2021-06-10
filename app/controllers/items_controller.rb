class ItemsController < ApplicationController
before_action :authenticate_user!,except: [:index,:show]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id, :status_id, :charge_id, :prefecture_id, :duration_id).merge(user_id: current_user.id)
  end
end