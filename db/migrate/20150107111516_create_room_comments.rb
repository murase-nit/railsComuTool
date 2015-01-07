class CreateRoomComments < ActiveRecord::Migration
  def change
    create_table :room_comments do |t|
      t.integer :room_id
      t.integer :offset
      t.string :comment

      t.timestamps
    end
  end
end
