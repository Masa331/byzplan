class PlansController < ApplicationController
  def new
  	@plan = Plan.new
  end

  def create
  	@plan = Plan.new(params[:plan])
  	if @plan.save
  		redirect_to root_url, notice: "Plan made!"
  	else
  		render 'new'
  	end
  end

  def show
  end
end
