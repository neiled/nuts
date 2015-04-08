class AddShoeSizeToTalent < ActiveRecord::Migration
  def change
    add_column :talents, :shoe_size, :string
  end
end
