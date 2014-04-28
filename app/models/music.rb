class Music < DataItem
  
  class << self
    def get_data
      data_item = Music.last || Music.new
      if data_item.needs_updating?
        data_item.update_attribute(:description, latest)
      end
      data_item.description
    end
    
    def latest
      last_api = ENV['LASTFM_API']
      last_secret = ENV['LASTFM_SECRET']
      lastfm = Lastfm.new(last_api, last_secret)
      tracks = lastfm.user.get_recent_tracks "pepler"
      "The last song I listened to was " + tracks.first["name"] + " by " + tracks.first["artist"]["content"]
    end
  end
  
end