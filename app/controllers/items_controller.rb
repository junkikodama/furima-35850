class ItemsController < ApplicationController
before_action :authenticate_user!,except: [:index,:show]
before_action :item_find ,only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    end
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

  private
  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id, :status_id, :charge_id, :prefecture_id, :duration_id).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

end