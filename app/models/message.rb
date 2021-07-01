class Message < ApplicationRecord
  # Direct associations

  belongs_to :chat

  belongs_to :user

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    body
  end

end
