class CircleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :user_id, :integer
  attribute :picture, :string

  # Direct associations

  has_many   :circles_contacts

  belongs_to :user

  # Indirect associations

  many_to_many :contacts
end
