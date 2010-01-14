class Distribution < ActiveRecord::Base
  belongs_to :foyer

#  Create a method for searching by date
  def self.search(search)
    @distributions = Distribution.find(:all, :conditions => ['date = ?', search], :order => "foyer_id ASC")
  end
end
