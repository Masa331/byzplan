# encoding: UTF-8
require 'spec_helper'

describe "StaticPages" do
    subject{page}
    
    describe "home" do
  		before do
        cookies[:step] = "summary"
        visit root_path
      end
  		it{should have_selector('.lead', text: 'Byzplan je jednoduch')}
      it{should have_selector('.span6')}
 #     it{should have_xpath("//img[@alt='Copyhat']")}
    end

    describe "O business planu" do
      before do
        visit about_path
      end

      it{should have_selector('h1', text: 'O Business')}
    end

	describe "header" do

  		let(:plan){FactoryGirl.create(:plan)}
      before{visit root_path}

      it{should have_selector('#logo')}
      it{should have_link('Nový')}
      it{should have_link('O Business plánu')}

  		describe "with valid :plan_id" do
  	  		before do
            cookies[:step] = "summary"
  	  			visit plan_path(plan.plan_id)
   	  		end
  			it{should have_link(plan.name)}
  	  	end

	  	describe "with invalid :plan_id" do
  			before do
  				plan.plan_id = "sdvkjbvashb654"
  				visit plan_path(plan.plan_id)
  			end

  			it{should_not have_link(plan_url(plan.plan_id))}
  			it{should have_selector('#logo')}
  		end
	end
end
