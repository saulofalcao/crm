# == Schema Information
#
# Table name: tipo_servico_executados
#
#  id              :integer         not null, primary key
#  servico_id      :integer
#  tipo_servico_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class TipoServicoExecutado < ActiveRecord::Base
	belongs_to :servico
	belongs_to :tipo_servico
end
