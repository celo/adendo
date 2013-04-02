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
    it 'should have a letter from the Room valid letters list' do
      room = FactoryGirl.create(:room, :letters => 'ABCD')
      match = Match.create(:room => room, :letter => 'Z')
      match.save.should be_false
    end

    it 'should validate uniqueness of letter in room' do
      room = FactoryGirl.create(:room, :letters => 'ABCD')
      match = Match.create(:room => room, :letter => 'A')
      match.save
      match2 = Match.create(:room => room, :letter => 'A')
      match2.save.should be_false
    end
  end


  describe 'play status' do
    before do
      @time_now = Time.now
      Time.stub!(:now).and_return(@time_now)
      @room = FactoryGirl.create(:room, :letters => 'ABCD', :maxmatchtime => 5)
    end
    subject { FactoryGirl.create(:match, :room => @room) }

    it 'should not have start time before start' do
      subject.started_at.should be_nil
    end

    it 'should automatically save stop time at room pre-defined time limit' do
      subject.stopped_at.should == @time_now + 5.minutes
    end

    context '.start!' do
      before { subject.start! }
      it 'should save the start time when starts' do
        subject.started_at.should_not be_nil
      end
      it 'should start time be now when start match' do
        subject.started_at.should == @time_now
      end
    end
    context '.stop!' do
      before { subject.stop! }
      it 'should save the stop time when stops' do
        subject.stopped_at.should == @time_now
      end
    end
  end



end
