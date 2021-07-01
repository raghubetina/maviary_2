class Invitation < ApplicationRecord
  # Direct associations

  belongs_to :chat,
             counter_cache: true

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    chat.to_s
  end
end
