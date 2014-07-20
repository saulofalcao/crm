class RenameColumnFromTipoServico < ActiveRecord::Migration
  def change
  	rename_column	:tipo_servicos, :tipo_servico, :nome
  end
end
