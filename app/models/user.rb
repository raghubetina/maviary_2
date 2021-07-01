# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  circles_count           :integer
#  contacts_as_added_count :integer
#  contacts_as_adder_count :integer
#  created_chats_count     :integer
#  email                   :string           default(""), not null
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
class User < ApplicationRecord
  # Direct associations
  has_many :access_grants,
           class_name: "Doorkeeper::AccessGrant",
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: "Doorkeeper::AccessToken",
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many   :messages,
             dependent: :destroy

  has_many   :invitations,
             dependent: :destroy

  has_many   :circles,
             dependent: :destroy

  has_many   :contacts_as_added,
             class_name: "Contact",
             foreign_key: "added_id",
             dependent: :destroy

  has_many   :contacts_as_adder,
             class_name: "Contact",
             foreign_key: "adder_id",
             dependent: :destroy

  has_many   :created_chats,
             class_name: "Chat",
             foreign_key: "creator_id"

  # Indirect associations

  has_many   :chats,
             through: :invitations,
             source: :chat

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
