class RemoveColumnTipoServicoIdFromServico < ActiveRecord::Migration
  def change
  	remove_column	:servicos, :tipo_servico_id
  end
end
