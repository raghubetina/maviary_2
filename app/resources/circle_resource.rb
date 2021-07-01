class CircleResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :user_id, :integer
  attribute :picture, :string

  # Direct associations

  # Indirect associations

end
