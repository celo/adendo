require 'spec_helper'

describe RoomColumn do
  context "associations" do
    it { should belong_to :room }
  end

  it 'should have a value'
end
