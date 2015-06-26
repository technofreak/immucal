class CreateVaccinations < ActiveRecord::Migration
  def change
    create_table :vaccinations do |t|
      t.integer :child_id
      t.integer :vaccine_id
      t.string :status

      t.timestamps null: false
      t.belongs_to :child
      t.belongs_to :vaccine
    end
  end
end
