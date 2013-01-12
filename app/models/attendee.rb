class Attendee < ActiveRecord::Base
  validates_presence_of :person
  validates_uniqueness_of :person

  attr_accessible :person, :project, :coach, :collaborate
end