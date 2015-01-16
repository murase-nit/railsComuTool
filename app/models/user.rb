class User < ActiveRecord::Base

	# ユーザ名の規定
	# 3文字以上30文字以下
	# 一意に決まること
	# 英数字、アンダーバーのみ
	validates :name,
		uniqueness: {message: "既に登録されています"},
		length: {minimum: 3, maxinum:30, message:"ユーザ名は3文字以上30文字以下にしてください"},
		format: {with: /\A(?:[A-Za-z]|[0-9])+\z/, message: "ユーザ名は英字と数字を含むようにしてください"}
	# パスワードの規定
	# 6文字以上30文字以下
	# 英数字のみ, 英字と数字が1文字以上
	validates :pass,
	length: {minimum: 6, maxinum: 30, message: "パスワードは6文字以上30文字以下にしてください"},
	format: {with: /\A(?:[A-Za-z]|[0-9])+\z/, message: "パスワードは英字と数字を含むようにしてください"},
	confirmation: {message: "パスワードが一致しません"}

end
