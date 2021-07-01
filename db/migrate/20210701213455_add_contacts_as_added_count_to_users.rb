class AddContactsAsAddedCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :contacts_as_added_count, :integer
  end
end
