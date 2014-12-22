class AddTalentToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :talent, index: true
  end
end
