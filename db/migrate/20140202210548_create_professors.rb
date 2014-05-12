class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :nome

      t.timestamps
    end
  end
end
