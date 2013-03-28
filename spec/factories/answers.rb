# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    room_user nil
    room_match nil
    room_column nil
    value "MyString"
    score 1
  end
end
