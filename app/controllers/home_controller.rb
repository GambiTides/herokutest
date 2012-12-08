class HomeController < ApplicationController

  def map
    @json = User.all.to_gmaps4rails
  end
    
end