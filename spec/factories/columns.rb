# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :column do |f|
    f.sequence(:name) { |n| "Column #{n}" }
    f.association(:room_id, :factory => :room)
  end
end
