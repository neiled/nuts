class CreatePickedJoinTable < ActiveRecord::Migration
  def change
    create_join_table :talents, :breakdowns do |t|
      # t.index [:talent_id, :breakdown_id]
      t.index [:breakdown_id, :talent_id]
    end
  end
end
