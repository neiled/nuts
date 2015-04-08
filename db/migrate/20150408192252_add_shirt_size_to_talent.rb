class AddShirtSizeToTalent < ActiveRecord::Migration
  def change
    add_column :talents, :shirt_size, :string
  end
end
