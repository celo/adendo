# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do |f|
    f.association(:room_id, :factory => :room)
    f.letter "A"
    f.started_at nil
    f.stopped_at nil
  end
  #factory :match_in_game, :class => "Match" do |f|
  #  f.association(:room_id, :factory => :room)
  #  f.letter "A"
  #  f.started_at 1.minutes.ago
  #  f.stopped_at nil
  #end
  #factory :match_stopped, :class => "Match" do |f|
  #  f.association(:room_id, :factory => :room)
  #  f.letter "A"
  #  f.started_at 5.minutes.ago
  #  f.stopped_at 2.minutes.ago
  #end
end
