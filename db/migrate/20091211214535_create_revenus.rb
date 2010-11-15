class CreateRevenus < ActiveRecord::Migration
  def self.up
    create_table :revenus do |t|
      t.column :type_de_revenu, :enum, :limit => [
                'Allocation Familiale',
                'Allocation Handicap',
                'Allocation Logement',
                'Allocation Parent Isolé',
                'Allocation de Soutien Familliale',
                'Allocation Spécifique Solidarité',
                'ASSEDIC',
                'Complement Libre Choix',
                'Pension Alimentaire',
                'Pension de Reversion',
                'Prestation d\'Accueil du Jeune Enfant',
                'Retraite',
                'RSA',
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
