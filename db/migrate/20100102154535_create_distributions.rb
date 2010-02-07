class CreateDistributions < ActiveRecord::Migration
  def self.up
    create_table :distributions do |t|
      t.references :element
      t.references :foyer, :null => false

      t.date :date, :default => Time.now
      t.integer :nombre_distribue
      t.float :prix, :null => false
      t.float :dette,  :default => 0
      t.boolean :donation_bras_ouverts
      t.timestamps
    end
  end

  def self.down
    drop_table :distributions
  end
end
