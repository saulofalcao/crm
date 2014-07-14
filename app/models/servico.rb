# == Schema Information
#
# Table name: servicos
#
#  id              :integer         not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  valor_orcamento :float
#  cliente_id      :integer
#  tipo_servico_id :integer
#

class Servico < ActiveRecord::Base
	belongs_to :cliente
end
