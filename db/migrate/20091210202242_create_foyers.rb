# :enum, :limit => [:low, :medium, :high, :critical],

class CreateFoyers < ActiveRecord::Migration
  def self.up
    create_table :foyers do |t|
      
      t.string :chef_nom, :null => false 
      t.string :chef_prenom, :null => false 
      t.column :chef_sex, :enum, :limit => [:M, :F], :null => false
      t.date :chef_date_naissance
      t.string :chef_ville_de_naissance
      t.references :pays #pays de naissance
      t.string :chef_email
      t.column :situation_familiale, :enum, :limit => [:Celibataire, :Marie, :Veuf, :Divorce, :Separe, :Concubinage], :null => false
      t.integer :nbr_colis_a_distribuer
      t.boolean :inscription_complete

      t.string :adresse_numero
      t.string :adresse_rue
      t.string :adresse_additionel
      t.string :adresse_chez
      t.string :adresse_code_postal
      t.string :telephone_portable
      t.string :telephone_fixe
      t.string :information_additionnelle
      
      t.boolean :sdf
      t.boolean :demandeur_asile
      t.boolean :handicape
      t.boolean :diabetique
      t.boolean :hallal
      t.boolean :sans_porc
      t.boolean :lettre_AS

      t.timestamps
    end
  end

  def self.down
    drop_table :foyers
  end
end
