class RoomCommentsController < ApplicationController

	def index
		@room = Room.find(2)
		p @room.room_comments
	end

	#指定された部屋のコメントを表示する
	# GET room_comments/:id
	def show
		puts "roomcommnetsコントローラshowアクション"
		@comments = RoomComment.where(room_id: params[:id]).order(id: :desc)
		@room = Room.find(params[:id])
	end

	# コメントの投稿
	# POST /room_comments
	def create
		@comment = RoomComment.new(roomComments_params)
		puts "コメント投稿"
		p @comment
		# ユーザ登録されていなかったときゲストとする
		@comment.user_id = 0 if @comment.user_id.nil?
		if @comment.save
			puts "コメント投稿成功"
			redirect_to room_comment_path(@comment[:room_id])
		else
			# 入力に不備があった.
			puts "コメント投稿失敗"
			flash[:err_comment] = @comment.errors.values
			redirect_to room_comment_path(@comment[:room_id])
		end
	end


	private
	# roomsテーブルにある項目だけを取り出す
	def roomComments_params
		puts "プライベートメソッドroomComments_params"
		p params
		params.require(:room_comment).permit(:comment, :room_id, :user_id)
	end

end
