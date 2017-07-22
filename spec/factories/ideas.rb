FactoryGirl.define do
  factory :idea do
    sequence :title do |i|
      "Jump to Conclusions Mat#{i}"
    end
    description "It has conclusions and you jump to them"
    user
    category
  end
end
