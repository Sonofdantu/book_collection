class DropBookCollectionsAndTasks < ActiveRecord::Migration[6.0] # Adjust the version number if necessary
  def up
    drop_table :book_collections
    drop_table :tasks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
