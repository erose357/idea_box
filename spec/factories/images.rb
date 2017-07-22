FactoryGirl.define do
  factory :image do
    sequence :name do |i|
      "light bulb#{i}"
    end
    url "http://www.dhresource.com/200x200s/f2-albu-g5-M00-06-F9-rBVaI1jcckqATFAAAAEWhfhLC78881.jpg/light-bulb-mascot-cartoon-factory-physical.jpg"
  end
end
