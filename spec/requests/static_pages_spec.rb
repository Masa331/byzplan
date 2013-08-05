# encoding: UTF-8
require 'spec_helper'

describe "StaticPages" do

    subject{page}
    
    describe "home" do
    		before{visit root_path}
    		it{should have_selector('.lead', text: 'Byzplan je jednoduch')}
        it{should have_selector('.span6')}
    end

    describe "O business planu" do
        before{visit about_path}
        it{should have_selector('h3', text: 'Co to je business plán')}
    end

  	describe "header" do

    		let(:plan){FactoryGirl.create(:plan)}
        before{visit root_path}

        it{should have_xpath("//img[@alt='Byzplan.cz']")}
        it{should have_link('Nový')}
        it{should have_link('O Business plánu')}

    		describe "with valid :plan_id" do
    	  		before{visit plan_path(plan.plan_id)}
            it{should have_link(plan.name)}
    	  end

  	  	describe "with invalid :plan_id" do
      			before do
      				visit plan_path("sdvkjbvashb654")
      			end

      			it{should_not have_link(plan.name)}
            it{should have_xpath("//img[@alt='Byzplan.cz']")}
    		end
  	end
end
