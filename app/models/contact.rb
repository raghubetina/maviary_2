class Contact < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :email, :uniqueness => { :scope => [:adder_id] }

  validates :email, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
