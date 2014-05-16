class Agendamento < ActiveRecord::Migration
  def change
	remove_column :agendamentos, :paciente, :medico
  end
end
