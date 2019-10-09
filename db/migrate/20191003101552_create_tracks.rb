class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.integer :albumid
      t.string :track

      t.timestamps
    end
  end
end
