class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|

      t.timestamps
    end
  end
end
