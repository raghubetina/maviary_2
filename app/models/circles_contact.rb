# == Schema Information
#
# Table name: circles_contacts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  circle_id  :integer          not null
#  contact_id :integer          not null
#
# Indexes
#
#  index_circles_contacts_on_circle_id   (circle_id)
#  index_circles_contacts_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (circle_id => circles.id)
#  fk_rails_...  (contact_id => contacts.id)
#
class CirclesContact < ApplicationRecord
  # Direct associations

  belongs_to :circle,
             counter_cache: true

  belongs_to :contact,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    circle.to_s
  end
end
