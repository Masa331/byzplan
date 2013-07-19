module PlansHelper
	def plans_url
		plan_url(session[:plan_id])
	end

	def plan_exists?
		session[:plan_id]
	end

	def current_step
    	session[:step]
    end

    def sections
        %w[Summary Team Product Customers Market Competitors Delivery Partners]
    end

    def czech_date
    	time = Time.now
    	time.to_formatted_s(:czech_format)
    end

    def page_number
        @page_number = 0 if @page_number > 6
        @page_number +=1
    end
end
