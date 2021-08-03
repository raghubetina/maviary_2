class InvitationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :chat_id, :integer
  attribute :recipient_id, :integer
  attribute :token, :string
  attribute :clicked, :integer
  attribute :rsvp_status, :string
  attribute :role, :string
  attribute :sender_id, :integer

  # Direct associations

  belongs_to :chat

  belongs_to :clicked_sender,
             resource: UserResource,
             foreign_key: :sender_id

  belongs_to :recipient,
             resource: UserResource

  belongs_to :sender,
             resource: UserResource

  # Indirect associations
end
