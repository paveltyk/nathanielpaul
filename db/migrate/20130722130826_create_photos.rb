class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.boolean :active, :null => false, :default => false
      t.integer :collection_item_id

      t.timestamps
    end
    add_index :photos, :collection_item_id
  end
end
