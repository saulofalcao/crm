class CreateAgendamentos < ActiveRecord::Migration
  def change
    create_table :agendamentos do |t|
      t.string :paciente
      t.string :data
      t.string :hora
      t.string :medico

      t.timestamps
    end
  end
end
