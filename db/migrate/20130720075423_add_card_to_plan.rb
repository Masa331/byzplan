class AddCardToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :card, :text
  end
end
