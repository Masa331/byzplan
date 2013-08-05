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

require 'spec_helper'

describe "Plan" do
	before do
		@plan = Plan.new(name: "Kavarna")
	end

	subject{@plan}

	it{should respond_to(:name)}
	it{should respond_to(:summary)}
	it{should respond_to(:team)}
	it{should respond_to(:product)}
	it{should respond_to(:customers)}
	it{should respond_to(:market)}
	it{should respond_to(:delivery)}
	it{should respond_to(:card)}


	#otestovat, ze e vzdy unikatni plan_id

end
