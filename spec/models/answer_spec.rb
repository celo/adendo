require 'spec_helper'

describe Answer do
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
    it { should validate_presence_of :player_id }
    it { should validate_presence_of :match_id }
    it { should validate_presence_of :column_id }
    it { should validate_presence_of :value }
    it { should allow_value("nil 0 5 10").for(:score) }
  end


  it 'should have a player from room players list'
  it 'should have a column from room columns list'
  it 'should have a value informed by a room player'

  describe 'scoring' do
    it 'should have the score equals nil before evaluate values' do
      answer = FactoryGirl.create(:answer)
      answer.save.should be_true
    end

    it 'should have the score equals 0, 5 or 10 points after evaluate values' do
      answer = FactoryGirl.create(:answer, :score => 1)
      answer.save.should be_false
    end
  end

  it 'should not save values when Match has not started' do
    match = FactoryGirl.create(:match)
    answer = FactoryGirl.create(:answer, :match => match)
    answer.save.should be_false
  end

  it 'should not save values when Match has stopped' do
    match = FactoryGirl.create(:match, :stopped_at => 1.second.ago)
    answer = FactoryGirl.create(:answer, :match => match)
    answer.save.should be_false
  end

end
