# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room_match do
    room nil
    letter "MyString"
    start_time "2013-03-28 14:17:52"
    stop_time "2013-03-28 14:17:52"
  end
end
