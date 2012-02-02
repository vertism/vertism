class RenameDataItems < ActiveRecord::Migration
  def change
    rename_table :dataitems, :data_items
  end
end
