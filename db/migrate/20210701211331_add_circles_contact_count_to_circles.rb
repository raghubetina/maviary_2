class AddCirclesContactCountToCircles < ActiveRecord::Migration[6.0]
  def change
    add_column :circles, :circles_contacts_count, :integer
  end
end
