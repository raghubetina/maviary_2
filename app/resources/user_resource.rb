class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :picture, :string

  # Direct associations

  has_many   :clicked_sent_invitations,
             resource: InvitationResource,
             foreign_key: :sender_id

  has_many   :received_invitations,
             resource: InvitationResource,
             foreign_key: :recipient_id

  has_many   :sent_invitations,
             resource: InvitationResource,
             foreign_key: :sender_id

  has_many   :messages

  has_many   :circles

  has_many   :contacts_as_added,
             resource: ContactResource,
             foreign_key: :added_id

  has_many   :contacts_as_adder,
             resource: ContactResource,
             foreign_key: :adder_id

  has_many   :created_chats,
             resource: ChatResource,
             foreign_key: :creator_id

  # Indirect associations
end
