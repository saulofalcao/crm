class AddColumnClienteIdToTarefas < ActiveRecord::Migration
  def change
    add_column :tarefas, :tarefas, :string
    add_column :tarefas, :cliente_id, :integer
  end
end
