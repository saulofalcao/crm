class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :endereco
      t.float :orcamento
      t.integer :servico_id

      t.timestamps
    end
  end
end
