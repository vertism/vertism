module Runkeeper
  class Client
    
    URL = 'https://api.runkeeper.com/'
    
    class << self
      
      def user
        @user ||= request('user', 'application/vnd.com.runkeeper.User+json')
      end
      
      def activities
        @activities ||= begin
          json = request('fitnessActivities', 'application/vnd.com.runkeeper.FitnessActivityFeed+json')
          parse(json)['items']
        end
      end
      
      def last_run
        run = Runkeeper::Run.new(activities.find{ |a| a['type'] == 'Running' })
        run.to_s
      end
      
      private
      
      def parse(data)
        JSON.parse(data)
      end
      
      def auth
        "Bearer #{ENV['RUNKEEPER_ACCESS']}"
      end
      
      def request(path, media_type)
        RestClient.get "#{URL}#{path}", { authorization: auth, accept: media_type}
      end
      
    end
    
  end
end