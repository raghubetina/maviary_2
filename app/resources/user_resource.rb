class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :picture, :string

  # Direct associations

  has_many   :created_chats,
             resource: ChatResource,
             foreign_key: :creator_id

  # Indirect associations

end
