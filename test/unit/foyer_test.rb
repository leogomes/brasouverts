require 'test_helper'

class FoyerTest < ActiveSupport::TestCase
  
  # Replace this with your real tests.
  test "creation of a foyer" do
    foyer = Foyer.new :chef_nom => 'Gomes', :chef_prenom => 'Leo', :chef_sex => :M
    assert_equal 'Leo', foyer.chef_prenom
    assert_equal 'Gomes', foyer.chef_nom
    assert_equal :M, foyer.chef_sex
  end

  test "name required" do
    foyer = Foyer.new # no name set
    assert !foyer.save, "Saving a foyer without a name"
  end


end
