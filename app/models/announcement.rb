require 'net/http'

class Announcement < ActiveRecord::Base
  attr_accessible :content
  after_commit :update_firehose

  protected

  def update_firehose
    req = Net::HTTP::Put.new("/announcements/#{id}/firehose.json")
    req.body = to_json
    Net::HTTP.start('127.0.0.1', 7474).request(req)
  end
end
