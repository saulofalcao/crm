class AddColumnPacienteNomeToAgendamentos < ActiveRecord::Migration
  def change
  	add_column :agendamentos, :paciente_nome, :string
  end
end
