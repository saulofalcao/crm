class AddColumnToServico < ActiveRecord::Migration
  def change
  	add_column	:servicos, :observacao, :text
  end
end
