require 'dropbox_sdk'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_dropbox_client
    if session[:access_token]
      begin
        access_token = session[:access_token]
        DropboxClient.new(access_token)
      rescue
        # Maybe something's wrong with the access token?
        session.delete(:access_token)
        raise
      end
    else
      redirect_to dropbox_auth_start_path
    end
  end
end
