class TipoServicoExecutado < ActiveRecord::Base
	belongs_to :servico
	belongs_to :tipo_servico
end
