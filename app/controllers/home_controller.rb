class HomeController < ApplicationController
  
  def main   
    @music = Music.get_data
    @run = Run.get_data
    
    Tweet.update
    @tweets = Tweet.order("id DESC").slice(0,3)
  end
end
