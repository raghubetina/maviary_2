class Invitation < ApplicationRecord
  # Direct associations

  belongs_to :chat,
             counter_cache: true

  belongs_to :clicked_sender,
             class_name: "User",
             foreign_key: "sender_id"

  belongs_to :recipient,
             class_name: "User",
             counter_cache: :received_invitations_count

  belongs_to :sender,
             class_name: "User",
             counter_cache: :sent_invitations_count

  # Indirect associations

  # Validations

  # Scopes

  scope :clicked, -> { where(clicked: 0) }

  def to_s
    chat.to_s
  end
end
