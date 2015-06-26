class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
      t.string :name
      t.string :disease
      t.string :recommended_by
      t.integer :age_start
      t.integer :age_end

      t.timestamps null: false
    end
  end
end
