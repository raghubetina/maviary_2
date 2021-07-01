class Circle < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:user_id] }

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
