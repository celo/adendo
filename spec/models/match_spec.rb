require 'spec_helper'

describe Match do
  context "associations" do
    it { should belong_to :room }
  end
  context "respond_to" do
    it { should respond_to :room_id }
    it { should respond_to :letter }
    it { should respond_to :started_at }
    it { should respond_to :stopped_at }
  end
  context 'validates' do
    it { should validate_presence_of :letter }
    it { should validate_uniqueness_of(:letter).scoped_to(:room_id) }
  end

  it 'should have a letter from the Room valid letters list' do
    room = FactoryGirl.create(:room, :letters => 'A,B,C,D')
    match = FactoryGirl.create(:match, :room => room, :letter => 'Z')
    match.save.should be_false
  end


  describe 'play status' do
    before { match = FactoryGirl.create(:match) }
    context '.start!' do
      before { match.start! }
      it 'should save the start time when starts' do
        match.started_at.should_not be_nil
      end
    end
    context '.stop!' do
      before { match.stop! }
      it 'should save the stop time when stops' do
        match.stopped_at.should == Time.now
      end
    end
  end


  it 'should automatically save stop time at room pre-defined time limit' do
    room = FactoryGirl.create(:room, :maxmatchtime => 5)
    match = FactoryGirl.create(:match, :room => room)
    match.stopped_at.should == 5.minutes.from_now
  end

end
