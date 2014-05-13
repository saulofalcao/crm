class Agendamento < ActiveRecord::Base
	 validates :paciente, :data, :medico, 
							 presence: true
	 validates :hora, 
				presence: true,
				uniqueness: {scope: :data}



end
