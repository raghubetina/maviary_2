# == Schema Information
#
# Table name: circles_contacts
#
#  id         :integer          not null, primary key
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
#  circle_id   (circle_id => circles.id)
#  contact_id  (contact_id => contacts.id)
#
require "rails_helper"

RSpec.describe CirclesContact, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:circle) }

    it { should belong_to(:contact) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
