class Medico < ActiveRecord::Base
	has_many	:agendamentos
	has_many	:pacientes, through: :agendamentos

	validates 	:nome, presence: true
end
