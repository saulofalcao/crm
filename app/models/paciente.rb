# == Schema Information
#
# Table name: pacientes
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Paciente < ActiveRecord::Base
	has_many	:agendamentos
	has_many 	:medicos, through: :agendamentos

	validates 	:nome, presence: true
end
