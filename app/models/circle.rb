class Circle < ApplicationRecord
  # Direct associations

  has_many   :circles_contacts,
             dependent: :destroy

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  has_many   :contacts,
             through: :circles_contacts,
             source: :contact

  # Validations

  validates :name, uniqueness: { scope: [:user_id] }

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
