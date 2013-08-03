class RenameTypeColumn < ActiveRecord::Migration
  def up
    rename_column :categories, :type, :name
  end

  def down
  end
end
