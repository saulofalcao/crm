class MedicosController < ApplicationController
	def seleciona_medico
		@paciente_id = params[:paciente_id]
		@paciente_nome = params[:paciente_nome]

		@medicos = Medico.all

	end

end
