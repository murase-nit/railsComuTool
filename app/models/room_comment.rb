class RoomComment < ActiveRecord::Base
	belongs_to :room
	belongs_to :user

	# コメントは空ではいけない
	validates :comment,
		presence: {message: "コメントが空です"}

end
