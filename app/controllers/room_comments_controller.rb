class RoomCommentsController < ApplicationController

	def index
		@room = Room.find(2)
		p @room.room_comments
	end

	#指定された部屋のコメントを表示する
	def show
		@comments = RoomComment.where(room_id: params[:id]).order(offset: :asc)
	end

end
