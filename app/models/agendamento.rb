class Agendamento < ActiveRecord::Base
	belongs_to :paciente
	belongs_to :medico

	 validates :paciente_id, :medico_id, :data, 
							 presence: true
	 validates :hora, 
				presence: true,
				uniqueness: {scope: :data}



end
