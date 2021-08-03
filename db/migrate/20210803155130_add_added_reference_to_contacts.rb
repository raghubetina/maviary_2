class AddAddedReferenceToContacts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :contacts, :users, column: :added_id
    add_index :contacts, :added_id
    change_column_null :contacts, :added_id, false
  end
end
