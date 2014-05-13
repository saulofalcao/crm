class RemoveColumnFromAgendamento < ActiveRecord::Migration
  def change
    remove_column :agendamentos, :medico
  end
end
