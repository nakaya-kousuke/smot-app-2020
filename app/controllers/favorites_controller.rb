class FavoritesController < ApplicationController
  before_action :set_store
  before_action :authenticate_user!

  def create
    if @store.user_id != current_user.user_id
      @favorite = Favorite.create(user_id: current_user.id, store_id: @store.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, store_id: @store.id)
    @favorite.destroy
  end

  private
  def set_store
    @store = Store.find(params[:store_id])
  end
end
