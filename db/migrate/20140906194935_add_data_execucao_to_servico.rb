class AddDataExecucaoToServico < ActiveRecord::Migration
  def change
    add_column :servicos, :data_execucao, :date
  end
end
