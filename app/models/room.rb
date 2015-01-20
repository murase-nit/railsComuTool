class Room < ActiveRecord::Base
	has_many :room_comments

	validates :name,
		presence: {message: "部屋名を入力してください"}

end
