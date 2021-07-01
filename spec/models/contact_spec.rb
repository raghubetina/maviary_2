require 'rails_helper'

RSpec.describe Contact, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:email).scoped_to(:adder_id) }

    it { should validate_presence_of(:email) }

    end
end
