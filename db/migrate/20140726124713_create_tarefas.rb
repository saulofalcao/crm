class CreateTarefas < ActiveRecord::Migration
  def change
    create_table :tarefas do |t|
      t.datetime :vencimento
      t.string :titulo
      t.integer :tarefavel_id
      t.string :tarefavel_tipo

      t.timestamps
    end
  end
end
