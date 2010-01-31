class Foyer < ActiveRecord::Base
  validates_presence_of :chef_nom, :chef_prenom
  has_many :membres
  has_many :revenues
  has_many :distributions

  def dette_cumulee

    dette_cumulee = 0
    
    self.distributions.each {
      |d|
      dette_cumulee += d.dette
    }

    return dette_cumulee
  end
  
  def nombre_enfants
    
    enfants = 0
    
    self.membres.each {
      |m|
      enfants += (age_at(Date.today, m.date_de_naissance) > 12 ? 0:1)
    }

    return enfants
    
  end

  def age_at(date, dob)
    day_diff = date.day - dob.day
    month_diff = date.month - dob.month - (day_diff < 0 ? 1 : 0)
    date.year - dob.year - (month_diff < 0 ? 1 : 0)
  end



end