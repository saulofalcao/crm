# == Schema Information
#
# Table name: clientes
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  servico_id :integer
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#  rua        :string(255)
#  numero     :string(255)
#  bairro     :string(255)
#  cep        :string(255)
#

class Cliente < ActiveRecord::Base
	has_many :servicos
end
