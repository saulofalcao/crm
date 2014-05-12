FactoryGirl.define do
  factory :user do
    nome     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end