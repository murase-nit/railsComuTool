class RoomCommentsController < ApplicationController

	def index
		@room = Room.find(2)
		p @room.room_comments
	end

	# 指定された部屋のコメントを表示する
	# def show
	# 	@comments = RoomComments
		
	# end

end
