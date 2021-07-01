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
class Invitation < ApplicationRecord
  # Direct associations

  belongs_to :chat,
             counter_cache: true

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    chat.to_s
  end
end
