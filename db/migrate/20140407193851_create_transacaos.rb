class CreateTransacaos < ActiveRecord::Migration
  def change
    create_table :transacaos do |t|
      t.float :valor
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
