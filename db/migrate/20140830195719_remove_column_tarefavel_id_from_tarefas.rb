class RemoveColumnTarefavelIdFromTarefas < ActiveRecord::Migration
  def change
    remove_column :tarefas, :tarefavel_id, :string
  end
end
