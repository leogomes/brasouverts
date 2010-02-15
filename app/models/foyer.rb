class Foyer < ActiveRecord::Base

  validates_presence_of :chef_nom, :chef_prenom
  has_many :membres
  has_many :revenus
  has_many :charges
  has_many :distributions
  has_one :country # pays de naissance

  # Calculates the accumulated debit by summing up the
  # debits of each distribution
  def dette_cumulee

    dette_cumulee = 0
    
    self.distributions.each {
      |d|
      dette_cumulee += (d.dette == nil ? 0 : d.dette)
      
    }

    return dette_cumulee
  end

  # Every member of the family who's under 12 is considered a child.
  def nombre_enfants
    
    enfants = 0
    
    self.membres.each {
      |m|
      enfants += (age_at(Date.today, m.date_de_naissance) > 12 ? 0:1)
    }

    return enfants
    
  end

  # Calculates the age at an specific point in time, based
  # on the date of birth
  def age_at(date, dob)
    day_diff = date.day - dob.day
    month_diff = date.month - dob.month - (day_diff < 0 ? 1 : 0)
    date.year - dob.year - (month_diff < 0 ? 1 : 0)
  end
  
end