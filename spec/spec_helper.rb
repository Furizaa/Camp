require 'rubygems'
require 'spork'

Spork.prefork do
    require 'mocha/api'

    ENV['RAILS_ENV'] ||= 'test'
    require File.expand_path('../../config/environment', __FILE__)
    require 'rspec/rails'
    require 'rspec/autorun'
    require 'shoulda'

    Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

    RSpec.configure do |config|
        config.fail_fast = ENV['RSPEC_FAIL_FAST'] == '1'
        config.mock_framework = :mocha
        config.order = 'random'

        # If you're not using ActiveRecord, or you'd prefer not to run each of your
        # examples within a transaction, remove the following line or assign false
        # instead of true.
        config.use_transactional_fixtures = true

        # If true, the base class of anonymous controllers will be inferred
        # automatically. This will be the default behavior in future versions of
        # rspec-rails.
        config.infer_base_class_for_anonymous_controllers = true

        config.before do
            ActiveRecord::Base.observers.disable :all
        end
    end
end

Spork.each_run do
    #Rails.cache.reconnect
end
