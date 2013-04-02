require "spec_helper"

describe EventsController do
  describe "routing" do

    it "routes to #index", slow: true do
      get("/events").should route_to("events#index")
    end

    it "routes to #new", slow: true do
      get("/events/new").should route_to("events#new")
    end

    it "routes to #show", slow: true do
      get("/events/1").should route_to("events#show", :id => "1")
    end

    it "routes to #edit", slow: true do
      get("/events/1/edit").should route_to("events#edit", :id => "1")
    end

    it "routes to #create", slow: true do
      post("/events").should route_to("events#create")
    end

    it "routes to #update", slow: true do
      put("/events/1").should route_to("events#update", :id => "1")
    end

    it "routes to #destroy", slow: true do
      delete("/events/1").should route_to("events#destroy", :id => "1")
    end

  end
end
