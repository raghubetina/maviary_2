class ContactResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :adder_id, :integer
  attribute :name, :string
  attribute :added_id, :integer
  attribute :email, :string
  attribute :picture, :string

  # Direct associations

  # Indirect associations

end