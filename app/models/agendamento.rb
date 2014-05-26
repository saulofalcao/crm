# == Schema Information
#
# Table name: agendamentos
#
#  id            :integer         not null, primary key
#  data          :string(255)
#  hora          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  medico_id     :integer
#  paciente_nome :string(255)
#

class Agendamento < ActiveRecord::Base
#	belongs_to :paciente
	belongs_to :medico

	 # validates :paciente_id, :medico_id, :data, 
							 # presence: true

	validates :paciente_nome, :medico_id, :data,
							presence: true
	 validates :hora, 
				presence: true,
				uniqueness: {scope: :data}



end
