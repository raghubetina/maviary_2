# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  ancestry   :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_messages_on_chat_id  (chat_id)
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Message, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:chat) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:body) }
  end
end
