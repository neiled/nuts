class DropBreakdownsTalentsTable < ActiveRecord::Migration
  def change
    drop_table :breakdowns_talents
  end
end
