class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:splash]

  def splash
    @user = current_user
    redirect_to categories_path if user_signed_in?
  end
end
