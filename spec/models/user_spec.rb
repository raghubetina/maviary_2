require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:clicked_sent_invitations) }

    it { should have_many(:received_invitations) }

    it { should have_many(:sent_invitations) }

    it { should have_many(:messages) }

    it { should have_many(:circles) }

    it { should have_many(:contacts_as_added) }

    it { should have_many(:contacts_as_adder) }

    it { should have_many(:created_chats) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
