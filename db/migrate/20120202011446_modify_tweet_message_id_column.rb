class ModifyTweetMessageIdColumn < ActiveRecord::Migration
  def up
    change_column :tweets, :message_id, :string, :null => false
  end

  def down
  end
end
