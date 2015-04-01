class AddDefaultWorkflowStatusToPicks < ActiveRecord::Migration
  def change
    change_column :picks, :workflow_state, :string, default: "new"
  end
end
