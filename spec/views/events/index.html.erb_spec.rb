require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :description => "MyText",
        :cost => "9.99",
        :status => "Status"
      ),
      stub_model(Event,
        :description => "MyText",
        :cost => "9.99",
        :status => "Status"
      )
    ])
  end

  it "renders a list of events", slow: true do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
