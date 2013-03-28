require 'spec_helper'

describe Answer do
  context "associations" do
    it { should belong_to :room_player }
    it { should belong_to :room_match }
    it { should belong_to :room_column }
  end
  context "respond_to" do
    it { should respond_to :room_player_id }
    it { should respond_to :room_match_id }
    it { should respond_to :room_column_id }
    it { should respond_to :value }
    it { should respond_to :score }
  end


  it 'should have a value informed by a room player'
  it 'should have the score 0, 5 or 10 points'
  it 'should not save values when match has not started'
  it 'should not save values when match has stopped'
end
