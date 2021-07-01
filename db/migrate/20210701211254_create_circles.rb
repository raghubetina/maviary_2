class CreateCircles < ActiveRecord::Migration[6.0]
  def change
    create_table :circles do |t|
      t.string :name
      t.integer :user_id
      t.string :picture

      t.timestamps
    end
  end
end
