class CreateTipoServicoExecutados < ActiveRecord::Migration
  def change
    create_table :tipo_servico_executados do |t|
      t.integer :servico_id
      t.integer :tipo_servico_id

      t.timestamps
    end
  end
end
