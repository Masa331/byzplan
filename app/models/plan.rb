# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  plan_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  summary    :text
#  team       :text
#  product    :text
#  customers  :text
#  market     :text
#  delivery   :text
#  card       :text
#

class Plan < ActiveRecord::Base

	attr_accessible :name, :summary, :team, :product, :customers, :market, :delivery, :card
	attr_accessor :current_step

	validates :name, presence: true, length:{maximum:50}
	validates :plan_id, presence: true, uniqueness: true

end
