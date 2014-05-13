class AddColumnToAgendamento < ActiveRecord::Migration
  def change
    add_column :agendamentos, :paciente_id, :integer
    add_column :agendamentos, :medico_id, :integer
    
    add_index :agendamentos, :paciente_id
    add_index :agendamentos, :medico_id
    add_index :agendamentos, :hora
    add_index :agendamentos, :data

  end
end
