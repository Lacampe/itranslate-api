source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'dotenv-rails', groups: [:development, :test]

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'google-cloud-translate'
gem 'jwt'
gem 'rack-cors'
gem 'rails', '~> 5.2.1'
gem 'redis', '~> 4.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# gem 'jbuilder', '~> 2.5'
# gem 'mini_magick', '~> 4.8'

# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
