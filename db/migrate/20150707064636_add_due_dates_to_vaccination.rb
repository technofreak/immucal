class AddDueDatesToVaccination < ActiveRecord::Migration
  def change
    add_column :vaccinations, :due_start, :date
    add_column :vaccinations, :due_end, :date 
  end
end
