require 'spec_helper'

describe User do
  describe "validations" do
    it{ should validate_presence_of :user_name }
    it{ should validate_uniqueness_of :user_name }
    it{ should validate_presence_of :email } 
    it{ should validate_uniqueness_of :email }
  end

end
