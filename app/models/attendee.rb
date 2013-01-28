class Attendee < ActiveRecord::Base
  validates_presence_of :person
  validates_uniqueness_of :person

  attr_accessible :person, :project, :use_help, :could_help
  after_commit :update_firehose

  def update_firehose
    req = Net::HTTP::Put.new("/attendees/#{id}/firehose.json")
    req.body = to_json
    Net::HTTP.start('127.0.0.1', 7474).request(req)
  end
end