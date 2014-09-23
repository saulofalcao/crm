class AddColumnObservacaoToOportunidades < ActiveRecord::Migration
  def change
    add_column :oportunidades, :observacao, :text
  end
end
