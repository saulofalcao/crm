class MedicosController < ApplicationController
	def seleciona_medico
		@paciente_id = params[:paciente_id]
		@paciente_nome = params[:paciente_nome]

		@medicos = Medico.all

	end

	def index
		@medicos = Medico.all
	end

	def show
		@medico = Medico.find(params[:id])
	end


	def new
		@medico = Medico.new
	end

	def create
		@medico=Medico.new(medico_params)
		if @medico.save
			flash[:success]="Médico incluido com sucesso"
			redirect_to medico_path(@medico)
		else
			flash[:error]="Erro ao salvar médico"
		end
	end

	def medico_params
		params.require(:medico).permit(:nome)
	end


end
