class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :child_id
      t.string :name
      t.date :date_of_birth
      t.string :gender

      t.timestamps null: false

      t.belongs_to :user, index: true
    end
  end
end
