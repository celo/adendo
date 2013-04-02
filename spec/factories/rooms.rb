# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do |f|
    f.sequence(:name) { |n| "Room #{n}" }
    f.letters "ABCDE"
    f.maxplayers 10
    f.maxmatches 10
    f.maxmatchtime 10
    f.private false
    f.association(:created_by, :factory => :user)
  end
end
