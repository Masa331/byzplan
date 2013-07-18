class RemoveCategoryFromPlans < ActiveRecord::Migration
  def up
    remove_column :plans, :category
  end

  def down
    add_column :plans, :category, :string
  end
end
