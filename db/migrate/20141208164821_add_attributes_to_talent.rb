class AddAttributesToTalent < ActiveRecord::Migration
  def change
    add_column :talents, :first_name, :string
    add_column :talents, :last_name, :string
    add_column :talents, :middle_name, :string
    add_column :talents, :date_of_birth, :date
    add_column :talents, :permit_expires, :date
  end
end
