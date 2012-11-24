FactoryGirl.define do
	factory :patient do
		first_name "Srinjoy"
		last_name "Chakravarty"
		email "chaxz93@gmail.com"
		password "srinjoy93"
		password_confirmation "srinjoy93"
		date_of_birth 4.years.ago.to_date
		gender "Male"
		health_id 1
		phone "97455641191"
	end	
end