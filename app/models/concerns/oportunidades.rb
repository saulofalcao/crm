module Oportunidades
	extend ActiveSupport::Concern

	def garantias_vencidas
		garantias_vencidas = []
		self.servicos.find_each(batch_size: 200) do |servico|
			if servico.data_garantia < Date.today
				garantias_vencidas << servico
			end 
		end
		return garantias_vencidas
	end

	def ultimos_servicos_por_tipo
		# self.servicos.find_each("") do |servico|
		# encontra os tipos de servico
		tipos_servicos = []
		TipoServico.each do |tipo_servico|
			tipos_servicos << tipo_servico.nome unless tipos_servicos.include?(tipo_servico.nome) 
		end

		# encontra os ultimos servicos executados de cada tipo
		ultimo_servico=self.servicos.last
		ultimo_servico.tipo_servico_executados.each do |tse|
			tse.tipo_servico.nome
		end


	end

	def servicos_futuros
		# servicos_futuros = []
		# self.servicos.where("data_execucao >= ?", Date.today).find_each do |servico_futuro|
			# servicos_futuros << servico_futuro
		# end
		# return servicos_futuros

		self.servicos.where("data_execucao >= ?", Date.today)


	end

	def tipos_servicos
		tipos_servicos = []
		self.tipo_servico_executados.each do |tse|
			tipos_servicos << tse.tipo_servico.nome unless tipos_servicos.include?(tse.tipo_servico.nome)
		end
		return tipos_servicos
	end 

	def tipos_servicos_futuros
		tipos_servicos_futuros = []
		servicos_futuros = self.servicos_futuros
		servicos_futuros.each do |servico_futuro|
			servico_futuro.tipo_servico_executados.each do |tse|
				tipos_servicos_futuros << tse.tipo_servico.nome unless tipos_servicos_futuros.include?(tse.tipo_servico.nome)
			end
		end
		return tipos_servicos_futuros
	end

	def oportunidades_futuras
		# tipos_servicos - tipos_servicos_futuros
		tipos_servicos
		tipos_servicos = self.tipos_servicos # array tipo [Baratas, Ratos]
		tipos_servicos_futuros = self.tipos_servicos_futuros
		return oportunidades_futuras = tipos_servicos - tipos_servicos_futuros
	end

end
