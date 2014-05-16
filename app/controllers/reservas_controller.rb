class ReservasController < ApplicationController
	

	def index
	end

	

	def new
		@reserva=Reserva.new()
		#if @er.nil?
		#	@er=[]
		#end

		#@er.push("teste123")
	#	if @@er.nil?
	#		@@er=[]
	#	end


	end

	def check_available
	
		
		begin
			start_date=params[:reserva][:start_date].to_date
		rescue => e
			logger.debug "Erro ao converter start_date em data: #{e.message.inspect}"
			flash[:error]="Formato de Data de Chegada inválido. Por favor, digite
			 	a data como nesse exemplo: 23/12/2013"
			redirect_to new_reserva_path
			return
		end

		
		begin
			end_date=params[:reserva][:end_date].to_date
		rescue => e
			logger.debug "Erro ao converter end_date em Data: #{e.message.inspect}"
			flash[:error]="Formato de Data de Saída inválido. Por favor, digite
											a data como nesse exemplo: 23/12/2013"
			 redirect_to new_reserva_path
			 return
		end


		if not datas_corretas(start_date, end_date)
		 	flash.now[:error]="Erro na data!"
		 	redirect_to new_reserva_path
		end

		@quartos_disponiveis=Reserva.available(start_date,end_date)
		@start_date=start_date
		@end_date=end_date

		# session[:reserva_id]=@reserva.id
		# @s=session[:reserva_id]
	end

	def create
		r=Reserva.new()
		r.start_date=params[:start_date]
		r.end_date=params[:end_date]
		r.quarto_id=params[:quarto_id]
		if r.save then
			flash[:sucess]="Reserva criada com sucesso!"
			redirect_to reservas_path
		else
			flash[:error]="Erro ao criar reserva!"
		end
			


	end
	


	def datas_corretas(start_date, end_date)
		# Primeiro verifica se a data é um número para depois
		# converter para data
		if not start_date.is_a? Date
			flash[:error]="Por favor, verifique se as datas foram digitadas corretamente"
			return false
		end

		# nunca deve entrar aqui, pois o teste anterior já testa se é uma data
		#if start_date == ''
		#	flash[:notice]="Favor digitar a Data de Chegada"
		#	return false
		#end
		if start_date < Date.today
			#start_date.errors.add(:date, "Data de inicio deve ser maior que hoje")
			flash.now[:errors]="Data de inicio deve ser maior que hoje"
			return false
		end

		# Testes com end_date
		if not end_date.is_a? Date
			flash[:error]="Por favor, verifique se as datas foram digitadas corretamente"
			return false
		end

		#Checa as duas datas
		if end_date <= start_date
			flash[:error]="Atenção, a data de saída está maior que a data de Chegada. 
							Por favor, verifique as datas digitadas e tente novamente"
			return false
		end

		return true
	end


end
