#if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
#end

source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'bootstrap-sass', '~> 2.3.1.0'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'tinymce-rails'
gem 'whenever'
gem 'execjs'
gem 'rvm-capistrano'

group :development, :test do
	gem 'sqlite3'
	gem 'rspec-rails', '2.11.0'
end

group :development, :production do
	gem 'capistrano'
end

group :development do
	gem 'annotate', '2.5.0'
end

group :test do
	gem 'capybara', '1.1.2'
	gem 'factory_girl_rails', '4.1.0'
end


group :assets do
	gem 'sass-rails',   '~> 3.2.3'
	gem 'coffee-rails', '~> 3.2.1'
	gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production do
	gem "mysql2"
end
