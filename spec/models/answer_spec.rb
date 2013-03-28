require 'spec_helper'

describe Answer do
  context "associations" do
    it { should belong_to :room_player }
    it { should belong_to :room_match }
    it { should belong_to :room_column }
  end
  it 'should have a value informed by a room player'
  it 'should have the score 0, 5 or 10 points'
  it 'should not save values when match has not started'
  it 'should not save values when match has stopped'
end
