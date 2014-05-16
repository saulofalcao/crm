class CreateAulas < ActiveRecord::Migration
  def change
    create_table :aulas do |t|
      t.string :titulo
      t.text :descricao
      t.integer :professor_id
      t.date :horario

      t.timestamps
    end
  end
end
