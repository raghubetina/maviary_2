# == Schema Information
#
# Table name: circles
#
#  id                     :bigint           not null, primary key
#  circles_contacts_count :integer
#  name                   :string
#  picture                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer          not null
#
# Indexes
#
#  index_circles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
