require 'runkeeper/client'

class Run < DataItem
  
  class << self
    def get_data
      data_item = Run.last || Run.new
      if data_item.needs_updating?
        data_item.update_attribute(:description, latest)
      end
      data_item.description
    end
    
    def latest
      Runkeeper::Client.last_run
    end
  end
  
end