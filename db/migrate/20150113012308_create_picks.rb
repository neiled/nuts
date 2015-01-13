class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :talent, index: true
      t.references :breakdown, index: true

      t.timestamps null: false
    end
    add_foreign_key :picks, :talents
    add_foreign_key :picks, :breakdowns
  end
end
