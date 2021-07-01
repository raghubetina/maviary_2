class CirclesContact < ApplicationRecord
  # Direct associations

  belongs_to :contact,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    circle.to_s
  end

end
