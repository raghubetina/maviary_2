# == Schema Information
#
# Table name: chats
#
#  id                :bigint           not null, primary key
#  cover             :string
#  ends_at           :datetime
#  event             :boolean
#  invitations_count :integer
#  link              :string
#  name              :string
#  picture           :string
#  starts_at         :datetime
#  topic             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  creator_id        :integer          not null
#
# Indexes
#
#  index_chats_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
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
