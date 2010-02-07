class CreateMembres < ActiveRecord::Migration
  def self.up
    create_table :membres do |t|
      t.references :foyer
      t.string :nom
      t.string :prenom
      t.date :date_de_naissance
      t.string :ville_de_naissance
      t.references :pays #pays de naissance
      t.column :sexe, :enum, :limit => [:M, :F], :null => false
      t.column :relation, :enum, :limit =>  
                        [:Epoux, :Epouse, :Fils, :Fille, :Parent, 'Petit fils', 'Petite fille', :Autre],
               :null => false  

      t.timestamps
    end
  end

  def self.down
    drop_table :membres
  end
end
