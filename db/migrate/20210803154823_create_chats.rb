class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.integer :creator_id
      t.string :picture
      t.text :topic
      t.string :link
      t.string :cover
      t.boolean :event
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
