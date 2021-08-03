class ChatResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :creator_id, :integer
  attribute :picture, :string
  attribute :topic, :string
  attribute :link, :string
  attribute :cover, :string
  attribute :event, :boolean
  attribute :starts_at, :datetime
  attribute :ends_at, :datetime

  # Direct associations

  has_many   :messages

  has_many   :invitations

  belongs_to :creator,
             resource: UserResource

  # Indirect associations
end
