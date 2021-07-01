# == Schema Information
#
# Table name: chats
#
#  id                :bigint           not null, primary key
#  cover             :string
#  ends_at           :datetime
#  event             :boolean
#  invitations_count :integer
#  link              :string
#  name              :string
#  picture           :string
#  starts_at         :datetime
#  topic             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  creator_id        :integer          not null
#
# Indexes
#
#  index_chats_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
class Chat < ApplicationRecord
  # Direct associations

  has_many   :messages,
             dependent: :destroy

  has_many   :invitations,
             dependent: :destroy

  belongs_to :creator,
             class_name: "User",
             counter_cache: :created_chats_count

  # Indirect associations

  has_many   :users,
             through: :invitations,
             source: :user

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
