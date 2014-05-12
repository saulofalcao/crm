class CreateReservas < ActiveRecord::Migration
  def self.up
    create_table :reservas do |t|
      t.date :start_date
      t.date :end_date
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end
