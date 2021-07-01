# == Schema Information
#
# Table name: contacts
#
#  id                     :integer          not null, primary key
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
#  added_id  (added_id => users.id)
#  adder_id  (adder_id => users.id)
#
require "rails_helper"

RSpec.describe Contact, type: :model do
  describe "Direct Associations" do
    it { should have_many(:circles_contacts) }

    it { should belong_to(:added) }

    it { should belong_to(:adder) }
  end

  describe "InDirect Associations" do
    it { should have_many(:circles) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:email).scoped_to(:adder_id) }

    it { should validate_presence_of(:email) }
  end
end
