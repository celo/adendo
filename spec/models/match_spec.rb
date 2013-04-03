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


  describe 'action' do
    before do
      Timecop.freeze
      @room = FactoryGirl.create(:room, :letters => 'ABCD', :maxmatchtime => 5)
      @player = FactoryGirl.create(:player, :room => @room)
      @match = FactoryGirl.create(:match, :room => @room, :letter => "A")
    end
    subject { @match }

    it 'should not have start time before start' do
      subject.started_at.should be_nil
    end

    it 'should not have stop time before start' do
      subject.stopped_at.should be_nil
    end

    context '.start!' do
      before do
        subject.start!
        column1 = FactoryGirl.create(:column, :room => @room)
        column2 = FactoryGirl.create(:column, :room => @room)
        answer1 = FactoryGirl.create(:answer, :match => @match, :player => @player, :column => column1, :value => "AA")
        answer2 = FactoryGirl.create(:answer, :match => @match, :player => @player, :column => column2, :value => "AA")
      end
      it 'should save the start time when starts' do
        subject.started_at.should_not be_nil
      end

      it 'should start time be now when start match' do
        subject.started_at.should == Time.now
      end

      it 'should automatically save stop time at room pre-defined time limit based on start time' do
        subject.stopped_at.should == subject.started_at + 5.minutes
      end

      it 'should not save start time if match has previously started' do
        Timecop.freeze(Time.now + 2.seconds)
        subject.start!
        subject.started_at.should_not == Time.now
      end

      it 'should not save start time if match has finished' do
        subject.stop!(@player)
        Timecop.freeze(Time.now + 2.seconds)
        subject.start!
        subject.started_at.should_not == Time.now
      end
    end

    context '.stop!' do
      it 'should not save the stop time when match has not started' do
        subject.stop!(@player)
        subject.stopped_at.should_not == Time.now
      end

      context 'on started match' do
        before do
          @column1 = FactoryGirl.create(:column, :room => @room)
          @column2 = FactoryGirl.create(:column, :room => @room)
          subject.start!
        end
        it 'should not save the stop time if player has not completed all answers' do
          match = FactoryGirl.create(:match, :room => @room, :letter => "B")
          match.start!
          Timecop.freeze(Time.now + 2.seconds)
          FactoryGirl.create(:answer, :match => match, :player => @player, :column => @column1, :value => "BB")
          match.stop!(@player)
          match.stopped_at.should_not == Time.now
        end

        it 'should save the stop time when stops' do
          FactoryGirl.create(:answer, :match => @match, :player => @player, :column => @column1, :value => "BB")
          FactoryGirl.create(:answer, :match => @match, :player => @player, :column => @column2, :value => "BB")
          Timecop.freeze(Time.now + 2.seconds)
          subject.stop!(@player)
          subject.stopped_at.should == Time.now
        end

        it 'should not save the stop time when match has previously finished' do
          Timecop.freeze(Time.now + 2.seconds)
          subject.stop!(@player)
          Timecop.freeze(Time.now + 2.seconds)
          subject.stop!(@player)
          subject.stopped_at.should_not == Time.now
        end

      end

    end
  end


end
