class AddTipoServicoIdToOportunidades < ActiveRecord::Migration
  def change
    add_column :oportunidades, :tipo_servico_id, :integer
  end
end
