class Contact < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :email, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
