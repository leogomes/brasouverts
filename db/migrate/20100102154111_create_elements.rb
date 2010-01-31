class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string :elementDistribue
      t.string :description
      t.timestamps
    end

    # Insert the initial elements
    Element.create(:elementDistribue => "Colis Alimentaire", :description => "Colis Alimentaire")
    Element.create(:elementDistribue => "Lait", :description => "1L de lait")

  end

  def self.down
    drop_table :elements
  end
end
