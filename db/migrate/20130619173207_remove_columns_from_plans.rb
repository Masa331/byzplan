class RemoveColumnsFromPlans < ActiveRecord::Migration
  def up
    remove_column :plans, :director
    remove_column :plans, :budget
  end

  def down
    add_column :plans, :budget, :string
    add_column :plans, :director, :string
  end
end
