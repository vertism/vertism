class HomeController < ApplicationController
  
  def main   
    up_token = ENV['UP_TOKEN']
    up = Jawbone::Session.new_from_token up_token
    yesterday = Date.today - 1
    summary = Jawbone::DailySummary.new(up.daily_summary yesterday)
    @summary = "Yesterday I " + summary.data["sleep_summary"]["sleeps"].first["title"].downcase! + " and walked " + summary.kilometers.to_s + " km"
    
    last_api = ENV['LASTFM_API']
    last_secret = ENV['LASTFM_SECRET']
    lastfm = Lastfm.new(last_api, last_secret)
    tracks = lastfm.user.get_recent_tracks "pepler"
    @lastTrack = "The last song I listened to was " + tracks.first["name"] + " by " + tracks.first["artist"]["content"]
    
    begin
      @tweets = Twitter.user_timeline("vertism").collect!{|x| x.text}.slice!(0,3)
    rescue
      @tweets = nil
    end
  end
end
