class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :numemploy
      t.string :sector
      t.string :about

      t.timestamps
    end
  end
end
