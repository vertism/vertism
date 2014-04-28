class Tweet < ActiveRecord::Base
  validates :message_id, :uniqueness => true
  
  class << self  
    
    def update
      if Tweet.all.none? || Tweet.last.updated_at < 15.minutes.ago
        client.user_timeline("vertism").slice!(0,3).reverse!.each do |tweet|
          Tweet.create(:message_id => tweet.id.to_s, :text => tweet.text)
        end
      end
    end
    
    def client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = ENV['TWITTER_TOKEN']
        config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
      end
    end
    
  end
end
