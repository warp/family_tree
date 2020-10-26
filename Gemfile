# frozen_string_literal: true

source 'https://rubygems.org'

ruby File.read('.ruby-version').strip

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'dotenv'
gem 'puma'
gem 'rack-cors'

group :development, :test do
  gem 'rubocop'
end

group :test do
  gem 'pry-byebug'
  gem 'rack-test'
  gem 'rspec'
  gem 'rspec_junit_formatter'
end
