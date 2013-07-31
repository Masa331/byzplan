if Rails.env.production?
	WickedPdf.config = {exe_path: '/usr/ports/converters/wkhtmltopdf/work/wkhtmltopdf-0.10.0_rc2/bin/wkhtmltopdf'}
end