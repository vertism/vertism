class DataItem < ActiveRecord::Base
  
  def update_music
    last_api = ENV['LASTFM_API']
    last_secret = ENV['LASTFM_SECRET']
    lastfm = Lastfm.new(last_api, last_secret)
    tracks = lastfm.user.get_recent_tracks "pepler"
    self.description = "The last song I listened to was " + tracks.first["name"] + " by " + tracks.first["artist"]["content"]
  end
  
  def update_tweets
    Twitter.user_timeline("vertism").slice!(0,3).reverse!.each do |tweet|
      Tweet.create(:message_id => tweet.id.to_s, :text => tweet.text)
    end
  end
  
  def self.get_data(name)
    update = false
    data_item = DataItem.find_by_name(name)
    if data_item.nil?
      data_item = DataItem.new(:name => name)
      update = true
    elsif data_item.updated_at < 15.minutes.ago
      update = true
    end
    
    if update == true
      begin
        data_item.send("update_#{name}")
      rescue
        puts "update_" + name + " failed"
        return ""
      end
      data_item.save!
    end
    
    data_item.description
  end
  
end
