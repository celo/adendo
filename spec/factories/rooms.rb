# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do |f|
    sequence(:name) { |n| "Room #{n}" }
    letters "ABCDE"
    maxplayers 10
    maxmatches 10
    maxmatchtime 10
    private false
    association(:created_by, :factory => :user)
  end
end
