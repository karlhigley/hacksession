class AttendeesController < ApplicationController

  def index
    @attendees = Attendee.all
  end

  def create
    Attendee.create(params[:attendee])
    redirect_to root_url
  end

  def destroy
    attendee = Attendee.find(params[:id])
    attendee.destroy if attendee
    redirect_to root_url
  end
end
