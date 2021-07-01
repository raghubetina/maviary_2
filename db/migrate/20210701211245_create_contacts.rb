class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :adder_id
      t.string :name
      t.integer :added_id
      t.string :email
      t.string :picture

      t.timestamps
    end
  end
end
