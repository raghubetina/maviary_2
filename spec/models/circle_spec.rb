require 'rails_helper'

RSpec.describe Circle, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }

    it { should validate_presence_of(:name) }

    end
end
