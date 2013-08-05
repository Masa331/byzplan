class RemoveUnusedFromPlans < ActiveRecord::Migration
  def up
    remove_column :plans, :competitors
    remove_column :plans, :partners
  end

  def down
    add_column :plans, :partners, :text
    add_column :plans, :competitors, :text
  end
end
