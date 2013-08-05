# encoding: UTF-8
class PlansController < ApplicationController

    require 'securerandom'

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(params[:plan])
        @plan.plan_id = SecureRandom.urlsafe_base64(20)
        if @plan.save
            redirect_to plan_url(@plan.plan_id)
            flash[:success] = "Plán byl úspěšně založen. Nyní se můžete pustit do psaní. Pokyny k jednotlivým sekcím najdete vždy pod editačním oknem."
            session[:plan_id] = @plan.plan_id
            session[:step] = "card"
        else
            flash[:error] = 'Zadejte prosím jméno Vašeho projektu'
            render 'new'
        end
    end

    def show
        if @plan = Plan.find_by_plan_id(params[:id])
            session[:plan_id] = @plan.plan_id
            session[:step] = params[:step] if steps.include?(params[:step])
            session[:step] ||= "card"
        
            respond_to do |format|
                format.html
                format.pdf do
                    render :pdf => "Business plán", layout: 'pdf.pdf', lowquality: false
                end
            end
        else
            redirect_to nonexistant_path
        end
    end

    def update
        if @plan = Plan.find_by_plan_id(session[:plan_id])
            if @plan.update_attributes(params[:plan])
                flash[:success] = 'Sekce byla úspěšně uložena'
                redirect_to plan_url(@plan.plan_id)
            else
                flash[:warning] = "Plán se nepodařilo uložit. Zkuste to prosím znovu."
                render 'show'
            end
        else
            redirect_to nonexistant_path
        end
    end

    def serve_pdf_plan
        if @plan = Plan.find_by_plan_id(session[:plan_id])
            send_data WickedPdf.new.pdf_from_string(render_to_string('plans/show.pdf.erb', layout: 'layouts/pdf.pdf.erb')), filename: 'Byzplan.pdf', lowquality: false
        else
            redirect_to nonexistant_path
        end
    end

    private

    def steps
        %w[summary team product customers market delivery card]
    end
end