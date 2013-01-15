class AnnouncementsController < ApplicationController
=begin
  def create
    Announcement.create(params[:announcement])
    redirect_to root_url
  end
=end

  def edit
  end

  def update
    success = @announcement.update_attributes(params[:announcement])
    redirect_to root_url
  end

=begin
  def destroy
    announcement = Announcement.find(params[:id])
    announcement.destroy if announcement
    redirect_to root_url
  end
=end
end
