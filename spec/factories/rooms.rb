# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyString"
    letters "MyString"
    maxplayers 1
    maxmatches 1
    maxmatchtime 1
    private false
  end
end
