require 'spec_helper'

describe Company do
  describe "validations" do
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of :name }
    it{ should validate_presence_of :email } 
    it{ should validate_uniqueness_of :email }
  end

describe "mass assignment" do
    it { should allow_mass_assignment_of :name}
    it { should allow_mass_assignment_of :email}
    it { should allow_mass_assignment_of :logo}

    # syntax for should_not
    # it { should_not allow_mass_assignment of :attribute }
  end


end