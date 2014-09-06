class CreateOportunidades < ActiveRecord::Migration
  def change
    create_table :oportunidades do |t|

      t.timestamps
    end
  end
end
