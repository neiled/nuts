class AddWorkflowStateToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :workflow_state, :string
  end
end
