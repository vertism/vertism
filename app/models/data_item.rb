class DataItem < ActiveRecord::Base
    
  def needs_updating?
    new_record? || updated_at < 15.minutes.ago
  end
  
end
