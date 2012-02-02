class TweetAddTweetId < ActiveRecord::Migration
  def up
    add_column :tweets, :message_id, :integer
    
    Tweet.all.each do |tweet|
      tweet.message_id = 0
      tweet.save
    end
    
    change_column :tweets, :message_id, :integer, :null => false
  end

  def down
  end
end
