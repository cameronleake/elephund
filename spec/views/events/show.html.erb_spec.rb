require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :description => "MyText",
      :cost => "9.99",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>", slow: true do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/Status/)
  end
end
