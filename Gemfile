source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'rails-observers'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
gem 'fast_xor', git: 'https://github.com/CodeMonkeySteve/fast_xor.git'

group :doc do
    # bundle exec rake doc:rails generates the API under doc/api.
    gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'


group :development do
    gem "annotate", git: "https://github.com/ctran/annotate_models.git"

    gem 'better_errors'
    gem 'binding_of_caller'

    gem 'rails_best_practices'

    gem 'thin'
end

group :test do
    gem 'fakeweb', '~> 1.3.0', require: false
    gem 'minitest', require: false
end

group :test, :development do
    gem 'fabrication', github: 'paulelliott/fabrication', require: false
    gem 'mocha', require: false
    gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
    gem 'rb-inotify', '~> 0.9', require: RUBY_PLATFORM =~ /linux/i ? 'rb-inotify' : false
    gem 'rspec-rails', require: false
    gem 'shoulda'
    gem 'pry-rails'
    gem 'pry-nav'
    gem 'spork-rails', :github => 'sporkrb/spork-rails'
    gem 'debugger'
end
