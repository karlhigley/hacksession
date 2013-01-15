class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_announcement

  protected

  def load_announcement
    @announcement = Announcement.last
    @announcement = Announcement.create(:content => "") unless @announcement
  end

end
