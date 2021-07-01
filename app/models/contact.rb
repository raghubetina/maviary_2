class Contact < ApplicationRecord
  # Direct associations

  belongs_to :adder,
             :class_name => "User",
             :counter_cache => :contacts_as_adder_count

  # Indirect associations

  # Validations

  validates :email, :uniqueness => { :scope => [:adder_id] }

  validates :email, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
