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
require "rails_helper"

RSpec.describe Circle, type: :model do
  describe "Direct Associations" do
    it { should have_many(:circles_contacts) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_many(:contacts) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }

    it { should validate_presence_of(:name) }
  end
end
