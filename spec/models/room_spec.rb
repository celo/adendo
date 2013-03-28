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
  it 'should require a name' do
    it should validate_presence_of :name
  end
  it 'should have a limit of players' do
    it should validate_presence_of :maxplayers
  end
  it 'should limit of players is numeric'

  it 'should have a limit of matches' do
    it should validate_presence_of :maxmatches
  end
  it 'should limit of matches is numeric'

  it 'should have a limit of time on match' do
    it should validate_presence_of :maxmatchtime
  end
  it 'should limit of time on match is numeric'

  describe 'list of valid letters' do
    it 'should have a list of valid letters to raffle' do
      @room = Room.new(:letters => nil)
      @room.save.should be_false
    end

    it 'should not have numbers in list of valid letters to raffle'

  end
  describe 'private games' do
    it 'should be private when private is true' do
      @room = Room.new(:private => nil)
      @room.save.should be_false
    end
    it 'should not be private when private is false'

  end
  it 'should have a creator to set options on room creation' do
    @room = Room.new(:created_by => nil)
    @room.save.should be_false
  end

end
