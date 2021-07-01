source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.3"

gem "activeadmin", "2.2.0"
gem "activerecord-import"
gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap3-datetimepicker-rails", "~> 4.17.43"
gem "bootstrap4-kaminari-views"
gem "coffee-rails"
gem "devise", "~> 4.7.2"
gem "doorkeeper", "~> 5.4.0"
gem "graphiti", "~> 1.2"
gem "graphiti-rails", github: "firstdraft/graphiti-rails", branch: "develop"
gem "ideas_generators", github: "firstdraft/ideas_generators"
gem "image_processing", "~> 1.2"
gem "jbuilder", "~> 2.7"
gem "kaminari"
gem "momentjs-rails", ">= 2.9.0"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.2", ">= 6.0.2.2"
gem "ransack"
gem "rollbar"
gem "rspec-rails"
gem "sass-rails", ">= 6"
gem "seed_dump", git: "https://github.com/firstdraft/seed_dump.git"
gem "shoulda-matchers"
gem "sprockets", "~> 3.7"
gem "sprockets-rails", require: "sprockets/railtie"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "vandal_ui", "~> 0.4"
gem "wdm" if Gem.win_platform?

group :development do
  gem "annotate"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rails-erd"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "sqlite3"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "pg"
  gem "rails_12factor"
end

group :development, :test do
  gem "pry-rails"
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "graphiti_spec_helpers"
end

group :test do
  gem "database_cleaner"
end
