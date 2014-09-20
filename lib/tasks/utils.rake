namespace :utils do
	desc "Utilidades Diversas"
	task cria_oportunidades: :environment do
		clientes = Cliente.all
		clientes.each do |cliente|
			cliente.oportunidades_futuras.each do |oportunidade_futura|
				Oportunidade.create(cliente_id: cliente.id, tipo_servico_id: oportunidade_futura, ativa:true)
			end
		end
	end

end

