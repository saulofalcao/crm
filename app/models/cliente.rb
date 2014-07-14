# == Schema Information
#
# Table name: clientes
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  endereco   :string(255)
#  orcamento  :float
#  servico_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Cliente < ActiveRecord::Base
end
