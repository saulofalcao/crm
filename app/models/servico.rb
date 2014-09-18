# == Schema Information
#
# Table name: servicos
#
#  id              :integer         not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  valor_orcamento :float
#  cliente_id      :integer
#  observacao      :text
#  data_execucao   :date
#  data_garantia   :date
#

# == Schema Information
#
# Table name: servicos
#
#  id              :integer         not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  valor_orcamento :float
#  cliente_id      :integer
#  observacao      :text
	

class Servico < ActiveRecord::Base
	belongs_to :cliente

	# has_many :servico_tipo_servico
	has_many :tipo_servico_executados
	has_many :tipo_servicos, through: :tipo_servico_executados
	accepts_nested_attributes_for :tipo_servico_executados, allow_destroy: true
	accepts_nested_attributes_for :tipo_servicos, allow_destroy: true

	# tarefas
	has_many :tarefas, as: :tarefavel
	accepts_nested_attributes_for :tarefas

	scope :novos_servicos, -> { where('data_execucao > ?',Date.today) }
	scope :servicos_antigos, -> { where('data_execucao <= ?', Date.today) }

	def self.garantias_vencidas(cliente)
		garantias_vencidas = []
		cliente.servicos.find_each(batch_size: 200) do |servico|
			if servico.data_garantia < Date.today
				garantias_vencidas << servico
			end 
		end
		return garantias_vencidas
	end

	def self.todas_garantias_vencidas
		todas_garantias_vencidas = []
		Servico.find_each() do |servico|

			if servico.data_garantia < Date.today 
				todas_garantias_vencidas << servico
			end rescue nil

		end
		return todas_garantias_vencidas
	end

	def self.novos_servicos

	end
end
