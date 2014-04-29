module Runkeeper
  class Run
    attr_accessor :duration, :distance, :start_time
    
    def initialize(data)
      @duration = data['duration']
      @distance = data['total_distance']
      @start_time = DateTime.parse(data['start_time'])
    end
    
    def to_s
      "#{days_ago} I ran #{distance_in_miles}"
    end
    
    private
    
    def distance_in_miles
      metres_in_mile = 1609.344
      miles = (@distance / metres_in_mile).round
      
      return '1 mile' if miles == 1
        
      "#{miles} miles"
    end
    
    def days_ago
      days = DateTime.now.to_date.day - @start_time.to_date.day
      
      case days
      when 0
        'today'
      when '1'
        '1 day ago'
      else
        "#{days} days ago"
      end
    end
    
  end
end