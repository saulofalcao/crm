class AgendamentosController < ApplicationController
	def new
		@medicos=Medico.all()
		@agendamento=Agendamento.new()
	end

	def create
		
	end
end
