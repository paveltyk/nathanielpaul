class CreateCollectionItems < ActiveRecord::Migration
  def change
    create_table :collection_items do |t|
      t.integer :collection_id
      t.timestamps
    end
    add_index :collection_items, :collection_id
  end
end
