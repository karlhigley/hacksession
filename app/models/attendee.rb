class Attendee < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :person
  validates_uniqueness_of :person

  attr_accessible :person, :project, :use_help, :could_help

  def twitter_handle
    user.twitter if user
  end
end