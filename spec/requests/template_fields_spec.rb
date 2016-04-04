require 'rails_helper'

RSpec.describe "TemplateFields", :type => :request do
  describe "GET /template_fields" do
    it "works! (now write some real specs)" do
      get template_fields_path
      expect(response).to have_http_status(200)
    end
  end
end
