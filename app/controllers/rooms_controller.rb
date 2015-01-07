class RoomsController < ApplicationController
	
	# 最初の画面, すべての部屋を表示する
	def index
		@rooms = Room.all
	end
end
