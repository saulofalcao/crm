class RemoveTipoFromServico < ActiveRecord::Migration
  def change
    remove_column :servicos, :tipo
  end
end
