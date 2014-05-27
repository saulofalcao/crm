class AgendamentosController < ApplicationController
	def lista_agendamentos_ajax
		date_from_ajax = params[:matched_date]
		medico_from_ajax = params[:medico_id]
		# reduce = Agendamento.where(:data => date_from_ajax)
		reduce = Agendamento.where(data: date_from_ajax, medico_id: medico_from_ajax)
		hour_on_date = reduce.collect {|x| x.hora}
		@new_dates = hour_on_date
		render :layout => false
	end

	def index
		# date_from_ajax = params[:matched_date]
		# reduce = Agendamento.where(:data => date_from_ajax)
		# hour_on_date = reduce.collect {|x| x.hour}
		# @new_dates = hour_on_date
		# render :layout => false
		@agendamentos = Agendamento.all

	end




	def new
		#@agendamento = Agendamento.create
		if params[:medico_id]
			@medico = Medico.find(params[:medico_id])
			cookies[:medico_id]=@medico.id
		else
			@medico=Medico.find(cookies[:medico_id])	
			#@medico=cookies[:medico_id]
		end
		@agendamento = Agendamento.new
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@agendamento = Agendamento.create(agendamentos_params)
		if @agendamento.save
			redirect_to new_agendamento_path
		else
			err = ''
			@agendamento.errors.full_messages.each do |m|
				err << m
		end
		redirect_to new_agendamento_path, :flash => { :alert => "#{err}, please try again" }
		end
	end

	def seleciona_horarios
		@paciente = Paciente.find(params[:paciente_id])
		@medico = Medico.find(params[:medico_id])
	end

	def agendamentos_params
		params.require(:agendamentos).permit(:data, :hora, :medico_id, :paciente_nome)
	end


	
end




# 	def new
# 		@medicos=Medico.all()
# 		@agendamento=Agendamento.new()
# 	end
# 	def seleciona_horarios
# 		render 'seleciona_horarios'
# 	end

# 	def create

# 	end

# 	def seleciona_horarios2
# 		render 'seleciona_horarios2'
# 	end
# end