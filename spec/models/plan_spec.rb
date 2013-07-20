# == Schema Information
#
# Table name: plans
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  plan_id     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  summary     :text
#  team        :text
#  product     :text
#  customers   :text
#  market      :text
#  competitors :text
#  delivery    :text
#  partners    :text
#  card        :text
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
	it{should respond_to(:competitors)}
	it{should respond_to(:delivery)}
	it{should respond_to(:partners)}
	it{should respond_to(:card)}


	describe "with blank name" do
		before{@plan.name = ""}
		it{should_not be_valid}
	end

	describe "Plan's name shouldnt be longer than 50 characters" do
		before{@plan.name = "a"*51}
		it{should_not be_valid}
	end
end
