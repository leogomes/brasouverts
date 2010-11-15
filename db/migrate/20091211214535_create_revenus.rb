class CreateRevenus < ActiveRecord::Migration
  def self.up
    create_table :revenus do |t|
      t.column :type_de_revenu, :enum, :limit => [
                'Allocation Spécifique Solidarité',
                'Allocation Parent Isolé',
                'Allocation Logement',
                'Allocation Familiale',
                'Prestation d\'Accueil du Jeune Enfant',
                'Allocation Handicap',
                'Pension de Reversion',
                'Pension Alimentaire',
                'Salaire',
                'Autres Revenus'],
                :null => false
      t.float :valeur
      t.references :foyer
      t.timestamps
    end
  end

  def self.down
    drop_table :revenus
  end
end
