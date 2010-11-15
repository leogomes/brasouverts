class Element < ActiveRecord::Base
  has_many :distributions

  def my_json
#    json = "{"
#
#    Element.find(:all).each {
#        |e|
        json += "\"" + e.id + "\" : \"" + e.prix_unitaire + "\""
#    }
#
#    json += "}"
  end
end
