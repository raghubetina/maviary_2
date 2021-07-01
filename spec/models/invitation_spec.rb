# == Schema Information
#
# Table name: invitations
#
#  id          :integer          not null, primary key
#  clicked     :integer
#  rsvp_status :string
#  token       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chat_id     :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_invitations_on_chat_id  (chat_id)
#  index_invitations_on_user_id  (user_id)
#
# Foreign Keys
#
#  chat_id  (chat_id => chats.id)
#  user_id  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Invitation, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:chat) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
