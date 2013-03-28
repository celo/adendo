require 'spec_helper'

describe RoomPlayer do
  context "associations" do
    it { should belong_to :user }
    it { should belong_to :room }
  end
end
