class AgendamentosController < ApplicationController
	def new
		@medicos=Medico.all()
		@agendamento=Agendamento.new()
	end
	def seleciona_horarios
		render 'seleciona_horarios'
	end

	def create
		
	end
end
