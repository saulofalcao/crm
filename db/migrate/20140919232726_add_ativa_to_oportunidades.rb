class AddAtivaToOportunidades < ActiveRecord::Migration
  def change
    add_column :oportunidades, :ativa, :boolean
  end
end
