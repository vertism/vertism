class ChangeNameToTypeInDataItems < ActiveRecord::Migration
  def change
    rename_column :data_items, :name, :type
  end
end
