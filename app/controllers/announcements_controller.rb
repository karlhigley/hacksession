class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.all

    respond_to do |format|
      format.json { render json: @announcements }
    end
  end

  def edit
  end

  def update
    @announcement.update_attributes(params[:announcement])
    redirect_to root_url
  end

end
