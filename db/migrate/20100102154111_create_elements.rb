class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string :elementDistribue
      t.string :description
      t.float :prix_unitaire
      t.timestamps
    end

    # Insert the initial elements
    Element.create(:elementDistribue => "Colis Alimentaire", :description => "Colis Alimentaire", :prix_unitaire => "1.50")
    Element.create(:elementDistribue => "Lait", :description => "1L de lait", :prix_unitaire => "0.40")

  end

  def self.down
    drop_table :elements
  end
end
