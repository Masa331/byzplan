class AddPropercolumnsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :summary, :text
    add_column :plans, :team, :text
    add_column :plans, :product, :text
    add_column :plans, :customers, :text
    add_column :plans, :market, :text
    add_column :plans, :competitors, :text
    add_column :plans, :delivery, :text
    add_column :plans, :partners, :text
  end
end
