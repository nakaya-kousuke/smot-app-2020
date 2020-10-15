class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @store = @user.stores

    favorites = Favorite.where(user_id: current_user.id).pluck(:store_id)
    @favorite_list = Post.find(Favorites)
  end
end
