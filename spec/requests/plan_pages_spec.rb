# encoding: UTF-8

require 'spec_helper'

describe "PlanPages" do

	subject{page}

	describe "Generating new plan" do
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

	describe "Show page" do
		
		let(:plan){FactoryGirl.create(:plan)}

		describe "with non-existant plan_id" do
			before do
				plan.plan_id = "ldkasc6545"
				visit plan_path(plan.plan_id)
			end

			it{should have_selector('h1', text: "Hledaný plán neexistuje")}
		end

		describe "of existing plan" do
			before{visit plan_path(plan.plan_id)}

			it{should have_selector('h3', text: "Hlavička plánu:")}

			it{should have_selector('.span9')}
			it{should have_selector('.span3')}

			describe "should have proper step links and buttons" do

				it{should have_link('Exportovat plán')}
				it{should have_link('Náhled PDF')}

				it{should have_link('Hlavička plánu')}
				it{should have_link('Představení projektu')}
				it{should have_link('Popis produktu')}
				it{should have_link('Obchodní model')}
				it{should have_link('Zákazníci')}
				it{should have_link('Trh')}
				it{should have_link('Tým projektu')}

				it{should have_button('Uložit hlavičku')}
			end

			describe "with step parameter for summary" do
				before{visit plan_path(plan.plan_id, step: 'summary')}
				it{should have_field('summary', with: "#{plan.summary}")}
				it{should have_button('Uložit sekci')}
			end

			describe "with step parameter for team field" do
				before{visit plan_path(plan.plan_id, step: 'team')}
				it{should have_field('team')}
			end

			describe "with step parameter for product field" do
				before{visit plan_path(plan.plan_id, step: 'product')}
				it{should have_field('product')}
			end

			describe "with step parameter for market field" do
				before{visit plan_path(plan.plan_id, step: 'market')}
				it{should have_field('market')}
			end

			describe "with step parameter for customers field" do
				before{visit plan_path(plan.plan_id, step: 'customers')}
				it{should have_field('customers')}
			end

			describe "with step parameter for delivery field" do
				
				before{visit plan_path(plan.plan_id, step: 'delivery')}
				it{should have_field('delivery')}
			end

			describe "with step parameter for contacts field" do
				before{visit plan_path(plan.plan_id, step: 'card')}
				it{should have_field('plan_name', with: "Kavarna")}
				it{should have_button('Uložit hlavičku')}

				describe "updating" do
					let(:plan){FactoryGirl.create(:plan)}
					before do
						fill_in "plan_name", with: "Tovarna"
						click_button "Ulozit"
						plan.reload
					end

					it{should have_selector('.alert-success', text: "Sekce")}
					it{should have_field('plan_name')}
					it{should have_field('plan_name', with: "#{plan.name}")}
				end
			end
		end
	end
end
