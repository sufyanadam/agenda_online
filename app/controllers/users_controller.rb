class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def signup
    redirect_to dropbox_main_path
  end

  def create
    p 'params!!',  params
    if User.exists?(dropbox_uid: params[:dropbox_uid])
      render json: {error: 'user already exists'} and return
    end

    user = User.create!(dropbox_token: params[:dropbox_token], dropbox_uid: params[:dropbox_uid])

    render json: {success: user}
  end
end
