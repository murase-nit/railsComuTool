class RoomsController < ApplicationController
	
	# 最初の画面
	def index
		@rooms = Room.all
	end
end
