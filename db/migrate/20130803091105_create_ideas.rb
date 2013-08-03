class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.string :status
      t.string :mode
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :ideas, :user_id
    add_index :ideas, :category_id
  end
end
