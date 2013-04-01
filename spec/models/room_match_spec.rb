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

  it 'should have a letter from the room valid letters list' do
    room = FactoryGirl.create(:room, :letters => 'A,B,C,D')
    match = FactoryGirl.create(:room_match, :room => room, :letter => 'Z')
    match.save.should be_false
  end


  describe 'play status' do
    before { @match = FactoryGirl.create(:room_match) }
    context '.start!' do
      before { @match.start! }
      it 'should save the start time when match starts' do
        @match.started_at.should_not be_nil
      end
    end
    context '.stop!' do
      before { @match.stop! }
      it 'should save the stop time when match stops' do
        @match.stopped_at.should_not be_nil
      end
    end
  end

  it 'should automatically end match when room pre-defined time limit is over'

end
