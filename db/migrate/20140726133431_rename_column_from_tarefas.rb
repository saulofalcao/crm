class RenameColumnFromTarefas < ActiveRecord::Migration
  def change
  	rename_column	:tarefas, :tarefavel_tipo, :tarefavel_type
  end
end
