class AddDataGarantiaToServico < ActiveRecord::Migration
  def change
    add_column :servicos, :data_garantia, :date
  end
end
