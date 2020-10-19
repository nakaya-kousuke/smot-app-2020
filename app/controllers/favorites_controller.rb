class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store

  # def create
  #   if @store.user_id != current_user.user_id
  #     @favorite = Favorite.create(user_id: current_user.id, store_id: @store.id)
  #   end
  # end

  # def destroy
  #   @favorite = Favorite.find_by(user_id: current_user.id, store_id: @store.id)
  #   @favorite.destroy
  # end

  def create
    user = current_user
    store = Store.find(params[:store_id])
    favorite = Favorite.create(user_id: user.id, store_id: store.id)
  end

  def destroy
    user = current_user
    store = Store.find(params[:store_id])
    favorite = Favorite.find_by(user_id: user.id, store_id: store.id)
    favorite.delete
  end

  private
  def set_store
    @store = Store.find(params[:store_id])
  end
end
