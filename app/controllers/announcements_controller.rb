class AnnouncementsController < ApplicationController

  def new
    @announcement = Announcement.new
  end

  def create
    Announcement.create(params[:announcement])
    redirect_to root_url
  end

  def destroy
    announcement = Announcement.find(params[:id])
    announcement.destroy if announcement
    redirect_to root_url
  end
end
