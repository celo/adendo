require 'spec_helper'

describe RoomPlayer do
  context "associations" do
    it { should belong_to :user }
    it { should belong_to :room }
  end
  context "respond_to" do
    it { should respond_to :room_id }
    it { should respond_to :user_id }
  end
end
