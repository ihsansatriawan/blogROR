FactoryGirl.define do
	factory :article do
		title { Faker::Lorem.characters(10) }
		body { Faker::Lorem.paragraph }
	end
end