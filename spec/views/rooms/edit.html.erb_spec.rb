require 'spec_helper'

describe "rooms/edit" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :name => "MyString",
      :letters => "MyString",
      :maxplayers => 1,
      :maxmatches => 1,
      :maxmatchtime => 1,
      :private => false
    ))
  end

  it "renders the edit room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", room_path(@room), "post" do
      assert_select "input#room_name[name=?]", "room[name]"
      assert_select "input#room_letters[name=?]", "room[letters]"
      assert_select "input#room_maxplayers[name=?]", "room[maxplayers]"
      assert_select "input#room_maxmatches[name=?]", "room[maxmatches]"
      assert_select "input#room_maxmatchtime[name=?]", "room[maxmatchtime]"
      assert_select "input#room_private[name=?]", "room[private]"
    end
  end
end
