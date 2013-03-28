require 'spec_helper'

describe "rooms/index" do
  before(:each) do
    assign(:rooms, [
      stub_model(Room,
        :name => "Name",
        :letters => "Letters",
        :maxplayers => 1,
        :maxmatches => 2,
        :maxmatchtime => 3,
        :private => false
      ),
      stub_model(Room,
        :name => "Name",
        :letters => "Letters",
        :maxplayers => 1,
        :maxmatches => 2,
        :maxmatchtime => 3,
        :private => false
      )
    ])
  end

  it "renders a list of rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Letters".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
