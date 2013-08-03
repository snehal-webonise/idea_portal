class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :count
      t.references :idea

      t.timestamps
    end
    add_index :ratings, :idea_id
  end
end
