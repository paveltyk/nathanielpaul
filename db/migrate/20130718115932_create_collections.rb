class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.boolean :active, :null => false, :default => false

      t.timestamps
    end
  end
end
