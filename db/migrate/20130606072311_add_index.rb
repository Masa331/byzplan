class AddIndex < ActiveRecord::Migration
  def up
  	add_index :plans, :plan_id
  end

  def down
  	remove_index :plans, :plan_id
  end
end
