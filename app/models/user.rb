class User < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  has_many   :invitations,
             :dependent => :destroy

  has_many   :circles,
             :dependent => :destroy

  has_many   :contacts_as_added,
             :class_name => "Contact",
             :foreign_key => "added_id",
             :dependent => :destroy

  has_many   :contacts_as_adder,
             :class_name => "Contact",
             :foreign_key => "adder_id",
             :dependent => :destroy

  has_many   :created_chats,
             :class_name => "Chat",
             :foreign_key => "creator_id"

  # Indirect associations

  # Validations

  validates :name, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
