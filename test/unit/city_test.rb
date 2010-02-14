require 'test_helper'

class CityTest < ActiveSupport::TestCase

  test "search by name" do

    cities = City.search 'An'

    assert cities.size > 0

    cities.each { |city|
      assert city.name.downcase.include? "an"
    }
 
  end
end
