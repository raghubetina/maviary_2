class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :body, :string
  attribute :ancestry, :string
  attribute :chat_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user

  # Indirect associations

end
