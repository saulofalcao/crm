# == Schema Information
#
# Table name: clientes
#
#  id          :integer         not null, primary key
#  nome        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  email       :string(255)
#  endereco    :string(255)
#  bairro      :string(255)
#  cep         :string(255)
#  complemento :string(255)
#  observacao  :text
#  telefone    :string(255)
#

class Cliente < ActiveRecord::Base
	has_many :servicos
	has_many :tarefas
	has_many :tipo_servico_executados, through: :servicos
	# scope :pending, where(id: "%")

	include Oportunidades

end
