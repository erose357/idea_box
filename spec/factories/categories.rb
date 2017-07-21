FactoryGirl.define do
  factory :category do
    sequence :name do |i|
      "Bad#{i}"
    end
  end
end
