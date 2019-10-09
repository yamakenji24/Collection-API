class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.integer :artistid
      t.string :album

      t.timestamps
    end
  end
end
