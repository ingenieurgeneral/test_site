# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
		sequence(:first_name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		password "foobar12"
		password_confirmation "foobar12"
		language "english"

		factory :admin do
			admin true
		end
	end
end
