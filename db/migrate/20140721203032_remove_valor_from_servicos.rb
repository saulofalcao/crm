class RemoveValorFromServicos < ActiveRecord::Migration
  def change
    remove_column :servicos, :valor, :string
  end
end
