class GoogleController < ApplicationController
  def map
    @users = User.all.select(:name, :latitude, :longitude) 
  end
end
