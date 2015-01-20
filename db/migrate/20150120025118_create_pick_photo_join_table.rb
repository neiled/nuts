class CreatePickPhotoJoinTable < ActiveRecord::Migration
  def change
    create_join_table :picks, :photos do |t|
      t.index [:pick_id, :photo_id]
      # t.index [:photo_id, :pick_id]
    end
  end
end
