# encoding: UTF-8

require 'spec_helper'

describe "PlanPages" do

	subject{page}

	describe "generating new plan" do
		let(:submit){"Vytvo"}
		before{visit new_plan_path}
		it{should have_selector('h1', text: 'Zadejte')}

		describe " with blank name" do
			it "shouldnt get generated" do
				expect{click_button submit}.not_to change(Plan, :count)
			end
		end

		describe " with filled name" do
			before do
				fill_in "plan_name", with: "Kavarna"
			end
			it "should get generated" do
				expect{click_button submit}.to change(Plan, :count).by(1)
			end
		end
	end

	describe "show page" do
		let(:plan){FactoryGirl.create(:plan)}

		describe "with non-existant plan_id" do
			before do
				plan.plan_id = "ldkasc6545"
				visit plan_path(plan.plan_id)
			end

			it{should have_selector('h1', text: "non-existant plan")}
		end

		describe "of existing plan" do
			before do
				cookies[:step] = "summary"
				visit plan_path(plan.plan_id)
			end

			it{should have_selector('h3', text: "Představení projektu")}

			it{should have_selector('.span9')}
			it{should have_selector('.span3')}

			describe "should have proper step links and buttons" do

				xit{should have_link('Export plan')}
				xit{should have_link('Mail plan URL')}

				it{should have_link('Hlavička plánu')}
				it{should have_link('Představení projektu')}
				it{should have_link('Popis produktu')}
				it{should have_link('Obchodní model')}
				it{should have_link('Zákazníci')}
				it{should have_link('Trh')}
				it{should have_link('Tým projektu')}


				it{should have_button('Ulo')}
			end

			describe "with no step parameter" do
				it{should have_field('summary', with: "#{plan.summary}")}
				it{should_not have_field('plan_team')}
				it{should_not have_field('plan_product')}
			
			end

			describe "with step parameter for team field" do
				before{visit plan_path(plan.plan_id, step: 'team')}
				it{should have_field('team', with: "#{plan.team}")}
				it{should_not have_field('plan_summary')}
				it{should_not have_field('plan_product')}
			end

			describe "with step parameter for product field" do
				before{visit plan_path(plan.plan_id, step: 'product')}
				it{should have_field('product', with: "#{plan.product}")}
				it{should_not have_field('plan_summary')}
				it{should_not have_field('plan_team')}
			end

			describe "with step parameter for market field" do
				before{visit plan_path(plan.plan_id, step: 'market')}
				it{should have_field('market', with: "#{plan.market}")}
				it{should_not have_field('plan_summary')}
				it{should_not have_field('plan_product')}
			end

			describe "with step parameter for customers field" do
				before{visit plan_path(plan.plan_id, step: 'customers')}
				it{should have_field('customers', with: "#{plan.customers}")}
				it{should_not have_field('plan_summary')}
				it{should_not have_field('plan_product')}
			end

			describe "with step parameter for contacts field" do
				before{visit plan_path(plan.plan_id, step: 'card')}
				it{should have_field('plan_name', with: "#{plan.name}")}
				it{should_not have_field('plan_summary')}
				it{should_not have_field('plan_product')}
			end

			describe "with step parameter for delivery field" do
				before{visit plan_path(plan.plan_id, step: 'delivery')}
				it{should have_field('delivery', with: "#{plan.delivery}")}
				it{should_not have_field('plan_summary')}
				it{should_not have_field('plan_product')}
			end

			describe "with step parameter for summary field" do
				before{visit plan_path(plan.plan_id, step: 'summary')}
				it{should have_field('summary', with: "#{plan.summary}")}
				it{should_not have_field('plan_team')}
				it{should_not have_field('plan_product')}
			end

			describe "with step parameter for partners field" do
				before{visit plan_path(plan.plan_id, step: 'partners')}
				xit{should have_field('partners', with: "#{plan.partners}")}
				xit{should_not have_field('plan_summary')}
				xit{should_not have_field('plan_product')}
			end
		end
	end
end
