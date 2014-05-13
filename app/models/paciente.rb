class Paciente < ActiveRecord::Base
	has_many	:agendamentos
	has_many 	:medicos, through: :agendamentos

	validates 	:nome, presence: true
end
