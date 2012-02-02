class HomeController < ApplicationController
  
  def main   
    @up = DataItem.get_data("up")
    @music = DataItem.get_data("music")
    DataItem.get_data("tweets")
    @tweets = Tweet.all.slice(0,3).collect{|x| x.text }
  end
end
