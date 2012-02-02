class DataItem < ActiveRecord::Base
  
  def update_up
    up_token = ENV['UP_TOKEN']
    up = Jawbone::Session.new_from_token up_token
    yesterday = Date.today - 1
    summary = Jawbone::DailySummary.new(up.daily_summary yesterday)
    self.description = "Yesterday I " + summary.data["sleep_summary"]["sleeps"].first["title"].downcase! + " and walked " + summary.kilometers.to_s + " km"
  end
  
  def update_music
    last_api = ENV['LASTFM_API']
    last_secret = ENV['LASTFM_SECRET']
    lastfm = Lastfm.new(last_api, last_secret)
    tracks = lastfm.user.get_recent_tracks "pepler"
    self.description = "The last song I listened to was " + tracks.first["name"] + " by " + tracks.first["artist"]["content"]
  end
  
  def update_tweets
    Twitter.user_timeline("vertism").slice!(0,3).each do |tweet|
      Tweet.create(:message_id => tweet.id_str, :text => tweet.text)
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
      eval("data_item.update_#{name}")
      data_item.save!
    end
    
    data_item.description
  end
  
end
