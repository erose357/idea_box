FactoryGirl.define do
  factory :user do
    sequence :username do |i|
      "tom#{i}"
    end

    sequence :email do |i|
      "tom@officespace.com#{i}"
    end

    password "password"
    #role 0

    factory :user_with_ideas do
      after(:create) do |user|
        create_list(:idea, 2, :user => user)
      end
    end
  end
end
