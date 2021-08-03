class AddAdderReferenceToContacts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :contacts, :users, column: :adder_id
    add_index :contacts, :adder_id
    change_column_null :contacts, :adder_id, false
  end
end
