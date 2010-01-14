class Foyer < ActiveRecord::Base
  validates_presence_of :chef_nom, :chef_prenom
  has_many :membres
  has_many :revenues
  has_many :distributions


end
