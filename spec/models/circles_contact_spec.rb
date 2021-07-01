require "rails_helper"

RSpec.describe CirclesContact, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:circle) }

    it { should belong_to(:contact) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
