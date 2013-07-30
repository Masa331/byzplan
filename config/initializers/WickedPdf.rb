if Rails.env.production?
	WickedPdf.config = {exe_path: '/usr/home/byzplancz/app/shared/bundle/ruby/1.9.1/bin/wkhtmltopdf'}
end