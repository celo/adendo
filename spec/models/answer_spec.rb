require 'spec_helper'

describe Answer do
  before do
    new_time = Time.local(2008, 9, 1, 12, 0, 0)
    Timecop.freeze(new_time)
    user = FactoryGirl.create(:user)
    @room = FactoryGirl.create(:room)
    @player = FactoryGirl.create(:player, :user => user)
    @column = FactoryGirl.create(:column)
    @match = FactoryGirl.create(:match, :room => @room)
  end

  context "associations" do
    it { should belong_to :player }
    it { should belong_to :match }
    it { should belong_to :column }
  end
  context "respond_to" do
    it { should respond_to :player_id }
    it { should respond_to :match_id }
    it { should respond_to :column_id }
    it { should respond_to :value }
    it { should respond_to :score }
  end
  context 'validates' do
    before { @match.start! }
    subject { FactoryGirl.create(:answer, :match => @match) }
    it { should validate_presence_of :player_id }
    it { should validate_presence_of :column_id }
    it { should validate_presence_of :value }
  end


  describe 'scoring' do
    before do
      @match.start!
    end
    it 'should have the score equals nil before evaluate values' do
      answer = Answer.new(:match => @match, :player => @player, :column => @column, :value => "AA", :score => nil)
      answer.save.should be_true
    end

    it 'should not update score points before match stops' do
      answer = Answer.new(:match => @match, :player => @player, :column => @column, :value => "AA", :score => nil)
      answer.save!
      Timecop.freeze(Time.now + 2.seconds)
      answer.score = 0
      answer.save.should be_false
    end

    it 'should update score equals 0, 5 or 10 points after match was stopped' do
      answer = Answer.new(:match => @match, :player => @player, :column => @column, :value => "AA", :score => nil)
      answer.save!
      Timecop.freeze(Time.now + 2.seconds)
      @match.stop!
      Timecop.freeze(Time.now + 2.seconds)
      answer.score = 0
      answer.save.should be_true
    end

    it 'should not update the score if differs from 0, 5 or 10 points' do
      answer = Answer.new(:match => @match, :player => @player, :column => @column, :value => "AA", :score => nil)
      answer.save!
      answer.score = 1
      answer.save.should be_false
    end

  end

  it 'should not save values when Match has not started' do
    answer = Answer.new(:match => @match, :player => @player, :column => @column, :value => "AA", :score => nil)
    answer.save.should be_false
  end


  it 'should not save values when Match has finished (stopped_at less then now)' do
    @match.start!
    Timecop.freeze(Time.now + 2.seconds)
    @match.stop!
    Timecop.freeze(Time.now + 1.seconds)
    answer = Answer.new(:match => @match, :player => @player, :column => @column, :value => "AA", :score => nil)
    answer.save.should be_false
  end

end
