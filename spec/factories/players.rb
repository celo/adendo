# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do |f|
    f.association(:room, :factory => :room)
    f.association(:user, :factory => :user)
  end
end
