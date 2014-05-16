class ChangeDateFormatInTableAulas < ActiveRecord::Migration
  def change
  	change_column :aulas, :horario, :datetime
  end
end
