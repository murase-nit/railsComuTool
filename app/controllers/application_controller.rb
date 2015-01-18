class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_auth, except: {controller: :login}

  private

  # アカウント認証ができているか確認
  def check_auth
  	puts "applicationコントローラーauthアクション"
  	if session[:user_id]
  		@authedUser = User.find session[:user_id]
  	end
  end
end
