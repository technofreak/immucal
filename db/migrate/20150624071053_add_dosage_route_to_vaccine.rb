class AddDosageRouteToVaccine < ActiveRecord::Migration
  def change
    add_column :vaccines, :dosage, :string
    add_column :vaccines, :route, :string
  end
end
