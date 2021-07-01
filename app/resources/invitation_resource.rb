class InvitationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :chat_id, :integer
  attribute :user_id, :integer
  attribute :token, :string
  attribute :clicked, :integer
  attribute :rsvp_status, :string

  # Direct associations

  # Indirect associations

end
