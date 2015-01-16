class LoginController < ApplicationController

	# ログイン画面の表示
	# GET /login
	def index
	end

	# ログイン認証処理
	# POST /login
	def auth
		puts "authアクション"
		p params
		p params[:username]
		p params[:passwd]
	end

	# ユーザ新規登録画面
	# GET /newAccount
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
