require 'spec_helper'

describe RoomMatch do
  context "associations" do
    it { should belong_to :room }
  end
  context "respond_to" do
    it { should respond_to :room_id }
    it { should respond_to :letter }
    it { should respond_to :start_time }
    it { should respond_to :stop_time }
  end
  context 'validates' do
    it { should validate_presence_of :letter }
    it { should validate_uniqueness_of(:letter).scoped_to(:room_id) }
  end

  it 'should have a letter from the room valid list'
  it 'should save the start time when match starts'
  it 'should save the stop time when match stops'
end
