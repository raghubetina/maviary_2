class Contact < ApplicationRecord
  # Direct associations

  has_many   :circles_contacts,
             dependent: :destroy

  belongs_to :added,
             class_name: "User",
             counter_cache: :contacts_as_added_count

  belongs_to :adder,
             class_name: "User",
             counter_cache: :contacts_as_adder_count

  # Indirect associations

  has_many   :circles,
             through: :circles_contacts,
             source: :circle

  # Validations

  validates :email, uniqueness: { scope: [:adder_id] }

  validates :email, presence: true

  # Scopes

  def to_s
    created_at
  end
end
