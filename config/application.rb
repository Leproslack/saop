require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Saop
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
  end
end
