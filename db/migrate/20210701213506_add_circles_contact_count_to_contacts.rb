class AddCirclesContactCountToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :circles_contacts_count, :integer
  end
end
