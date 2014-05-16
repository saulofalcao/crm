class CreateRemedios < ActiveRecord::Migration
  def change
    create_table :remedios do |t|
      t.string :descricao
      t.integer :quantidade

      t.timestamps
    end
  end
end
