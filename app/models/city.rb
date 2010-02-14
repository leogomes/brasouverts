class City < ActiveRecord::Base

  #  Default search by name
  def self.search(search)
    @cities = City.find(:all, :conditions => ['name LIKE ?', "%#{search}%"], :order => "name ASC")
  end

    #  Default search by postal code
  def self.search_by_code(search)
    @cities = City.find(:all, :conditions => ['code LIKE ?', "%#{search}%"], :order => "code ASC")
  end


end
