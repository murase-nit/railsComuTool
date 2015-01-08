class RoomsController < ApplicationController

	# 最初の画面, すべての部屋を表示する
	# GET /rooms
	def index
		@rooms = Room.all
	end

	# 新規部屋作成
	# POST /rooms
	def create
		@room = Room.new(rooms_params)
#		puts "roomの中身"
#		p @room
		@room.save
		redirect_to rooms_path
	end

	private
	# roomsテーブルにある項目だけを取り出す
	def rooms_params
#		p params
		params.require(:room).permit(:name)
	end


end
