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
		@account = User.new
		p @account
	end

	# 新規ユーザ登録処理
	# POST /createAccount
	def createAccount
	end




end
