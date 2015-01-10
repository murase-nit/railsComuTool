class Room < ActiveRecord::Base
	has_many :room_comments
end
