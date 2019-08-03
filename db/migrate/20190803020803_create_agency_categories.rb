class CreateAgencyCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :agency_categories do |t|
      t.references :agency, foreign_key: true
      t.references :category, foreign_key: true
      t.string :other

      t.timestamps
    end
  end
end
