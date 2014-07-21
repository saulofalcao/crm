class CreateServicos < ActiveRecord::Migration
  def change
#    drop_table :servicos
    create_table :servicos do |t|
      t.float :valor
	t.string :tipo

      t.timestamps
    end
  end
end
