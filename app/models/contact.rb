# == Schema Information
#
# Table name: contacts
#
#  id                     :bigint           not null, primary key
#  circles_contacts_count :integer
#  email                  :string
#  name                   :string
#  picture                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  added_id               :integer          not null
#  adder_id               :integer          not null
#
# Indexes
#
#  index_contacts_on_added_id  (added_id)
#  index_contacts_on_adder_id  (adder_id)
#
# Foreign Keys
#
#  fk_rails_...  (added_id => users.id)
#  fk_rails_...  (adder_id => users.id)
#
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
