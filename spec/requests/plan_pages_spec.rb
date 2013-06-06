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

	describe "visiting show page" do
		let(:plan){FactoryGirl.create(:plan)}

		describe "with non-existant plan_id" do
			before do
				plan.plan_id = "ldkasc6545"
				visit plan_path(plan.plan_id)
			end

			it{should have_selector('h1', text: "non-existant plan")}
		end

		describe "of existing plan" do
			before{visit plan_path(plan.plan_id)}

			it{should have_selector('h1', text: "Plan page")}
			it{should have_selector('p.plan_name', text: "#{plan.name}")}
			it{should have_selector('p.plan_id', text: "#{plan.plan_id}")}
			it{should have_selector('p.plan_category', text: "#{plan.category}")}

			describe "edditing Plan's data" do
				before do
					fill_in "plan_category", with: "Restauraterstvi"
					click_button "Update Plan"
				end

				it{should have_selector('p.plan_category', text: "Restauraterstvi")}
			end
		end
	end
end
