class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @attendees = Sitting.all
  end
end
