# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  plan_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe "Plan" do
	before do
		@plan = Plan.new(name: "Kavarna")
	end

	subject{@plan}

	it{should respond_to(:name)}

	describe "with blank name" do
		before{@plan.name = ""}
		it{should_not be_valid}
	end

	describe "Plans name shouldnt be longer than 50 characters" do
		before{@plan.name = "a"*51}
		it{should_not be_valid}
	end
end
