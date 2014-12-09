class CreateBreakdowns < ActiveRecord::Migration
  def change
    create_table :breakdowns do |t|
      t.string :name
      t.text :description
      t.references :project_id, index: true

      t.timestamps
    end
  end
end
