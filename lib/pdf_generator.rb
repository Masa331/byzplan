class PdfGenerator

	def initialize
		@pdf_document = Prawn::Document.new page_size: 'A4'
	end

	def self.generate_test
		Prawn::Document.new do
			text "Testovaci pdf z libu"
		end.render
	end

	def header_name(project_name)
		@pdf_document.bounding_box([0, @pdf_document.bounds.top], width: @pdf_document.bounds.right, height: 20) do
			@pdf_document.stroke_bounds
			@pdf_document.text project_name, align: :center, size: 15
		end
	end

	def footer(footer_content)
		@pdf_document.bounding_box([0, @pdf_document.bounds.bottom+20], width: @pdf_document.bounds.right, height: 15) do
			@pdf_document.text footer_content
			@pdf_document.stroke_bounds
		end
	end

	def contacts(contacts)
		@pdf_document.bounding_box([0, @pdf_document.bounds.top-40], width: 150, height: 100 ) do
			@pdf_document.text contacts, size: 15
			@pdf_document.stroke_bounds
		end
	end

	def section(section_name, section_content)
		@pdf_document.bounding_box([0, @pdf_document.bounds.top-200], width: @pdf_document.bounds.right, height: 500) do
			@pdf_document.text section_name, size: 20
			@pdf_document.text section_content, size: 10
			@pdf_document.stroke_bounds
		end
	end

	def pagination
		@pdf_document.draw_text "1/5", at: [@pdf_document.bounds.width/2, @pdf_document.bounds.bottom+40]
	end

	def title_page(project_name)

	end

	def render_me
		@pdf_document.render
	end
end