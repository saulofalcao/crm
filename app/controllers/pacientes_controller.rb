class PacientesController < ApplicationController
	def new
		@paciente=Paciente.new()
	end

	def create
		@paciente=Paciente.new(paciente_params)
		if @paciente.save
			flash[:success]="Paciente incluido com sucesso"
			redirect_to paciente_path(@paciente)
		else
			flash[:error]="Erro ao salvar paciente"
		end
	end

	def paciente_params
		params.require(:paciente).permit(:nome)
	end

end


