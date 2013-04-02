require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :description => "MyText",
      :cost => "9.99",
      :status => "MyString"
    ))
  end

  it "renders the edit event form", slow: true do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "textarea#event_description[name=?]", "event[description]"
      assert_select "input#event_cost[name=?]", "event[cost]"
      assert_select "input#event_status[name=?]", "event[status]"
    end
  end
end
