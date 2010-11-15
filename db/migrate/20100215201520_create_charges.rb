class CreateCharges < ActiveRecord::Migration
  def self.up
    create_table :charges do |t|
      t.column :type_de_charge, :enum, :limit => [
        'Loyer',
        'Dettes',
        'Pension Alimentaire',
        'Autres'],
        :null => false
      t.float :valeur
      t.references :foyer

      t.timestamps
    end
  end

  def self.down
    drop_table :charges
  end
end
