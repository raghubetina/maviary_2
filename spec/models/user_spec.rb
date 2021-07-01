# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  circles_count           :integer
#  contacts_as_added_count :integer
#  contacts_as_adder_count :integer
#  created_chats_count     :integer
#  email                   :citext           default(""), not null
#  encrypted_password      :string           default(""), not null
#  invitations_count       :integer
#  name                    :string
#  picture                 :string
#  remember_created_at     :datetime
#  reset_password_sent_at  :datetime
#  reset_password_token    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:messages) }

    it { should have_many(:invitations) }

    it { should have_many(:circles) }

    it { should have_many(:contacts_as_added) }

    it { should have_many(:contacts_as_adder) }

    it { should have_many(:created_chats) }
  end

  describe "InDirect Associations" do
    it { should have_many(:chats) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
