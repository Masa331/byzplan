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
            session[:plan_name] = @plan.name
#            UserMailer.url_mail(@user).deliver
        else
            flash[:error] = 'Zadejte prosím jméno Vašeho projektu'
            render 'new'
        end
    end

    def show
        if @plan = Plan.find_by_plan_id(params[:id])
            session[:plan_id] = @plan.plan_id
            session[:step] ||= "summary"
            session[:plan_name] = @plan.name        
            session[:step] = params[:step] if steps.include?(params[:step])
        
            respond_to do |format|
                format.html
                format.pdf do
                    render :pdf => "Business plan", layout: 'pdf.pdf', lowquality: false
                end
            end
        else
            redirect_to nonexistant_path
        end
    end

    def update
        redirect_to nonexistant_path unless @plan = Plan.find_by_plan_id(session[:plan_id])
        if @plan.update_attributes(params[:plan])
            flash[:success] = 'Sekce byla úspěšně uložena'
            redirect_to plan_url(@plan.plan_id)
        else
            flash[:warning] = "Plán se nepodařilo uložit. Zkuste to prosím znovu."
            render 'show'
        end
    end

    def destroy_old
        if Plan.clean_old_plans
            flash[:success] = 'Old plans destroyed'
            redirect_to root_url
        else
            redirect_to nonexistant_path
        end
    end

    def serve_pdf_plan
        if @plan = Plan.find_by_plan_id(session[:plan_id])
            @page_number ||= 0
            send_data WickedPdf.new.pdf_from_string(render_to_string('plans/show.pdf.erb', layout: 'layouts/pdf.pdf.erb')), filename: 'Byzplan.pdf', lowquality: false
        end
    end

    private

    def steps
        %w[summary team product customers market delivery card]
    end

end