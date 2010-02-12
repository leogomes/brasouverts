class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.timestamps
    end

    # Insert the initial elements
    Country.create(:name => "Brésil", :code => "55")

  end

  def self.down
    drop_table :countries
  end
end
