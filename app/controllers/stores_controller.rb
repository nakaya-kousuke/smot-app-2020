class StoresController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
  end

  private
  def store_params
    params.require(:store)
          .permit(:store_name,
                  :postal_code,
                  :prefectures,
                  :ctiy,
                  :block_number,
                  :phone_number,
                  :open_time,
                  :close_time,
                  :holiday,
                  :smoking_environment,
                  :website_url)
  end

  def set_store
    @store = Store.find(params[:id])
  end
end
