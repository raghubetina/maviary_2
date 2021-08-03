class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :clicked_sent_invitations,
             -> { clicked },
             class_name: "Invitation",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :received_invitations,
             class_name: "Invitation",
             foreign_key: "recipient_id",
             dependent: :destroy

  has_many   :sent_invitations,
             class_name: "Invitation",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :messages,
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
