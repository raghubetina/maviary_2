require "rails_helper"

RSpec.describe Invitation, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:chat) }

    it { should belong_to(:clicked_sender) }

    it { should belong_to(:recipient) }

    it { should belong_to(:sender) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
