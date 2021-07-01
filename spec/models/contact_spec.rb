require "rails_helper"

RSpec.describe Contact, type: :model do
  describe "Direct Associations" do
    it { should have_many(:circles_contacts) }

    it { should belong_to(:added) }

    it { should belong_to(:adder) }
  end

  describe "InDirect Associations" do
    it { should have_many(:circles) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:email).scoped_to(:adder_id) }

    it { should validate_presence_of(:email) }
  end
end
