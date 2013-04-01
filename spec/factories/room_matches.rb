# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room_match do |f|
    f.association(:room_id, :factory => :room)
    f.letter "A"
    f.start_time nil
    f.stop_time nil
  end
  factory :room_match_in_game do |f|
    f.association(:room_id, :factory => :room)
    f.letter "A"
    f.started_at 2.minutes.ago
    f.stopped_at nil
  end
  factory :room_match_stopped do |f|
    f.association(:room_id, :factory => :room)
    f.letter "A"
    f.started_at 10.minutes.ago
    f.stopped_at 2.minutes.ago
  end
end
