# == Schema Information
#
# Table name: medicos
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Medico < ActiveRecord::Base
	has_many	:agendamentos
	has_many	:pacientes, through: :agendamentos

	validates 	:nome, presence: true
end
