FactoryGirl.define do
  factory :user do
    first_name 'Tom' 
    last_name 'Oakes'
    email 'ready@ready.com'
    password 'maverick1'
    password_confirmation 'maverick1'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :item do
  	title 'Gibson'
  	subtitle 'Ej200'
  	condition 4
  	description 'Brand new mint condition gibson classic'
  	day_price 10
  	user_id 1
  end

end
