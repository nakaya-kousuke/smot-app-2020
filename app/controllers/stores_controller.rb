class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.includes(:user).order("created_at DESC")
  end

  def new
    @store = Store.new
    @store.images.new
  end

  def create
    @store = Store.new(store_params)
    if params[:store][:images_attributes] && @store.save
      redirect_to root_path
    else
      @store.images.new
      render :new
    end
  end

  def show
    @images = @store.images
  end

  # def edit
  #   @item.images.new
  # end

  # def update
  #   @category = @item.category_id
  #   if @item.update(item_params) 
  #     redirect_to item_path
  #   elsif item_params[:images_attributes] == ""
  #     render :edit
  #   else item_params[:category_id].blank?
  #     @item.category_id = @category
  #     render :edit
  #   end
  # end

  def destroy
    if @store.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def store_params
    params.require(:store)
          .permit(:store_name,
                  :postal_code,
                  :prefectures,
                  :ctiy,
                  :block_number,
                  :apartment_name,
                  :phone_number,
                  :open_time,
                  :close_time,
                  :holiday,
                  :smoking_environment,
                  :website_url,
                  images_attributes: [:image_url, :id, :_destroy])
          .merge(user_id: current_user.id)
  end

  def set_store
    @store = Store.find(params[:id])
  end
end
