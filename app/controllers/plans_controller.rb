class PlansController < ApplicationController

  require 'securerandom'

  def new
  	@plan = Plan.new
  end

  def create
  	@plan = Plan.new(params[:plan])
    @plan.plan_id = SecureRandom.urlsafe_base64(20)
  	if @plan.save
  		redirect_to plan_url(@plan.plan_id), notice: "Plan made!"
  	else
  		render 'new'
  	end
  end

  def show
    redirect_to nonexistant_path unless @plan = Plan.find_by_plan_id(params[:id])
  end

  def update
    @plan = Plan.find_by_plan_id(params[:id])
    if @plan.update_attributes(params[:plan])
      flash[:success] = "Plan updated"
      redirect_to plan_url(@plan.plan_id), notice: "Plan updated"
    else
      render 'show'
    end
  end
end
