run "pgrep spring | xargs kill -9"
remove_file "Gemfile"
create_file "Gemfile" do
<<-RUBY
source "http://rubygems.org"
ruby '#{RUBY_VERSION}'

gem 'rails', '#{Rails.version}'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder' '~> 2.5'
gem 'devise'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
end

group :test do
  gem 'simplecov', :require => false
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'binding_of_caller'
  gem 'better_errors'
end
