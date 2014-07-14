class AddTipoServicoIdToServicos < ActiveRecord::Migration
  def change
    add_column :servicos, :tipo_servico_id, :integer
  end
end
