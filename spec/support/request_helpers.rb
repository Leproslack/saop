require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def login
    user = FactoryGirl.create(:user)
    login_as user, scope: :user
    user
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :feature
end