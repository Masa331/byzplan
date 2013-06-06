require 'spec_helper'

describe "PlanPages" do

	subject{page}

	describe "generating new plan" do
		let(:submit){"Create Plan"}
		before{visit new_plan_path}
		it{should have_selector('h1', text: 'Make a plan')}

		describe " with blank name" do
			it "shouldnt get generated" do
				expect{click_button submit}.not_to change(Plan, :count)
			end
		end

		describe " with filled name" do
			before do
				fill_in "Name", with: "Kavarna"
			end
			it "should get generated" do
				expect{click_button submit}.to change(Plan, :count).by(1)
			end
		end

	end
end
