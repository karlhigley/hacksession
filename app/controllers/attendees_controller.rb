class AttendeesController < ApplicationController
  def index
    @attendees = Attendee.all
    @default_name = user_signed_in? ? current_user.name : ''
  end

  def create
    attendee = Attendee.create(params[:attendee])
    if user_signed_in?
      current_user.attendee = attendee
      current_user.save
    end
    redirect_to root_url
  end

  def destroy
    attendee = Attendee.find(params[:id])
    attendee.destroy if attendee
    redirect_to root_url
  end

end
