# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
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
#  chat_id  (chat_id => chats.id)
#  user_id  (user_id => users.id)
#
class Message < ApplicationRecord
  # Direct associations

  belongs_to :chat

  belongs_to :user

  # Indirect associations

  # Validations

  validates :body, presence: true

  # Scopes

  def to_s
    body
  end
end
