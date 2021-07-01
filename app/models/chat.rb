class Chat < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  has_many   :invitations,
             :dependent => :destroy

  belongs_to :creator,
             :class_name => "User",
             :counter_cache => :created_chats_count

  # Indirect associations

  # Validations

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
