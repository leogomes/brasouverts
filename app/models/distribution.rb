class Distribution < ActiveRecord::Base
  belongs_to :foyer

#  Create a method for searching by date
  def self.search(search)
    @distributions = Distribution.find(:all, :conditions => ['date = ?', search], :order => "foyer_id ASC")
  end

  # Calculates the total spent in this distribution
  def total
    self.nombre_distribue * self.prix
  end
end
