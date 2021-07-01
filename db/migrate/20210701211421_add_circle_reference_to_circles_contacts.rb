class AddCircleReferenceToCirclesContacts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :circles_contacts, :circles
    add_index :circles_contacts, :circle_id
    change_column_null :circles_contacts, :circle_id, false
  end
end
