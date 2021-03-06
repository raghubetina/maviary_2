class CirclesContactResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :circle_id, :integer
  attribute :contact_id, :integer

  # Direct associations

  belongs_to :circle

  belongs_to :contact

  # Indirect associations
end
