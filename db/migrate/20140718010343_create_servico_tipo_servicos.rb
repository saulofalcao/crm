class CreateServicoTipoServicos < ActiveRecord::Migration
  def change
    create_table :servico_tipo_servicos do |t|
      t.references :servico, index: true
      t.references :tipo_servico, index: true

      t.timestamps
    end
  end
end
