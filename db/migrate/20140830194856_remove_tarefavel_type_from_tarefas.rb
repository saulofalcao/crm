class RemoveTarefavelTypeFromTarefas < ActiveRecord::Migration
  def change
  	remove_column :tarefas, :tarefavel_type
  end
end
