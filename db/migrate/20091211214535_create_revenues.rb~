class CreateRevenues < ActiveRecord::Migration
  def self.up
    create_table :revenues do |t|
      t.column :type_de_revenue, :enum, :limit => [
                                :RSA,
                                :AllocSS,
                                :AllocLog,
                                :AllocationFamilial,
                                :AllocPI,
                                :PAJE,
                                :AllocHandicap,
                                :Loyer,
                                :Salaire,
                                :Assedic,
                                :Retraite,
                                :PensRevers,
                                :PensAlim,
                                :AutrePension,
                                :AutresRevenues,
                                :chargesSuplementaires],
                                :null => false
      t.float :valeur
      t.references :foyer

      t.timestamps
    end
  end

  def self.down
    drop_table :revenues
  end
end
