class AddColumnsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :budget, :integer
    add_column :plans, :director, :string
  end
end
