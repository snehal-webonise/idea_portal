class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.references :idea

      t.timestamps
    end
    add_index :comments, :idea_id
  end
end
