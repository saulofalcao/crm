class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
