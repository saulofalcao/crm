class RemoveColumnPacienteIdFromAgendamento < ActiveRecord::Migration
  def change
  	remove_column :agendamentos, :paciente_id
  end
end
