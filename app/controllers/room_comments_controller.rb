class RoomCommentsController < ApplicationController

	def index
		@room = Room.find(2)
		p @room.room_comments
	end

end
