class CreateTipoServicos < ActiveRecord::Migration
  def change
    create_table :tipo_servicos do |t|
      t.string :tipo_servico

      t.timestamps
    end
  end
end
