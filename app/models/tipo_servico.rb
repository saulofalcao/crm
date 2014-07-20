# == Schema Information
#
# Table name: tipo_servicos
#
#  id           :integer         not null, primary key
#  tipo_servico :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class TipoServico < ActiveRecord::Base
	# has_many :servicos, through: :servico_tipo_servicos
	has_many :servicos, through: :tipo_servico_executados

end
