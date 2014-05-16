FactoryGirl.define do
  factory :user do
    nome     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  factory :agendamento do
  	paciente 	"João da Silva"
  	data		"2014-06-01"
  	horario		"1830"
  	medico		"Paulo Lopes"
  end
end