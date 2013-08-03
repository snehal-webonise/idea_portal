class AddUsefullFieldToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :how_usefull, :string
  end
end
