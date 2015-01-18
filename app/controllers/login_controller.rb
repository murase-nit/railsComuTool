class LoginController < ApplicationController

	# ログイン画面の表示
	# GET /login/index
	def index
		puts "loginコントローラーindexアクション"
	end

	# ログアウト
	# POST /login/logout
	def logout
		puts "logoutアクション"
		reset_session
		redirect_to controller: :rooms, acion: :index
	end

	# ログイン認証処理
	# POST /login/auth
	def auth
		puts "authアクション"
		usr = User.auth(params[:username], params[:passwd])
		if usr != nil
			# 認証成功
			reset_session
			session[:user_id] = usr.id
			params[:referer] != "" ? redirect_to(params[:referer]) : redirect_to({controller: :rooms, action: :index})
		else
			# 認証失敗
#			flash.now[:referer] = params[:referer]
			@error = "認証に失敗しました"
			render 'index'
		end
	end

	# ユーザ新規登録画面
	# GET /login/newAccount
	def newAccount
		puts "newAccountアクション"
		@user = User.new
		p @user
	end

	# 新規ユーザ登録処理
	# POST /createAccount
	def createAccount
		puts "createAccountアクション"
		p params
		@user = User.new(user_params)
		puts "ユーザ登録これからする"
		if @user.save
			session[:user_id] = @user.id
			redirect_to controller: :rooms, action: :index
		else
			render action: :newAccount
		end
	end

private
	# データの受け取り
	def user_params
		puts "データの受け取り"
		p params.require(:user).permit(:name, :pass, :pass_confirmation)
		params.require(:user).permit(:name, :pass, :pass_confirmation)
	end

end
