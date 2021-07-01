class AddContactsAsAdderCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :contacts_as_adder_count, :integer
  end
end
