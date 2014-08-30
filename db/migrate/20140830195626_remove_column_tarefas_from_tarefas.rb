class RemoveColumnTarefasFromTarefas < ActiveRecord::Migration
  def change
    remove_column :tarefas, :tarefas, :string
  end
end
