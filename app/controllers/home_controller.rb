class HomeController < ApplicationController
  
  def main   
    @music = DataItem.get_data("music")
    DataItem.get_data("tweets")
    @tweets = Tweet.order("id DESC").slice(0,3).collect{|x| x.text }
  end
end
