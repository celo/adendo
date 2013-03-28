require 'spec_helper'

describe RoomColumn do
  context "associations" do
    it { should belong_to :room }
  end
  context "respond_to" do
    it { should respond_to :room_id }
    it { should respond_to :value }
  end

  it 'should have a value'
end
