require "rails_helper"

RSpec.describe Chat, type: :model do
  describe "Direct Associations" do
    it { should have_many(:messages) }

    it { should have_many(:invitations) }

    it { should belong_to(:creator) }
  end

  describe "InDirect Associations" do
    it { should have_many(:users) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
