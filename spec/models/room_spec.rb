require 'spec_helper'

describe Room do
  context "respond_to" do
    it { should respond_to :name }
    it { should respond_to :maxplayers }
    it { should respond_to :maxmatches }
    it { should respond_to :maxmatchtime }
    it { should respond_to :private }
    it { should respond_to :letters }
    it { should respond_to :created_by }
  end
  context 'validates' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :maxplayers }
    it { should validate_presence_of :maxmatches }
    it { should validate_presence_of :maxmatchtime }
    it { should validate_presence_of :letters }
    # it { should validate_presence_of :created_by }
    it { should validate_numericality_of :maxplayers }
    it { should validate_numericality_of :maxmatches }
    it { should validate_numericality_of :maxmatchtime }
  end

  it 'should not have numbers in list of valid letters to raffle' do
    room = Room.new(:letters => "1")
    room.should have(1).error_on(:letters)
  end

end
