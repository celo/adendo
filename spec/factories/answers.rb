# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do |f|
    f.association(:player, :factory => :player)
    f.association(:match, :factory => :match)
    f.association(:column, :factory => :column)
    f.sequence(:value) { |n| "Answer #{n}" }
    f.score nil
  end
end
