require "rails_helper"

RSpec.describe TemplateFieldsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/template_fields").to route_to("template_fields#index")
    end

    it "routes to #new" do
      expect(:get => "/template_fields/new").to route_to("template_fields#new")
    end

    it "routes to #show" do
      expect(:get => "/template_fields/1").to route_to("template_fields#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/template_fields/1/edit").to route_to("template_fields#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/template_fields").to route_to("template_fields#create")
    end

    it "routes to #update" do
      expect(:put => "/template_fields/1").to route_to("template_fields#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/template_fields/1").to route_to("template_fields#destroy", :id => "1")
    end

  end
end
