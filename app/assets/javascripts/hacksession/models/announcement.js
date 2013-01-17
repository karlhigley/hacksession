HackSession.Announcement = DS.Model.extend({
  content: DS.attr('string'),
  firehoseStream: null,
  markdownContent: function () {
    return HackSession.markdownConverter.makeHtml(this.get('content'));
  }.property('content'),
  setupFirehose: function() {
    if (this.get('isLoaded') == true){
      model = this;
      this.firehoseStream = new Firehose.Consumer({
        uri: '//localhost:7474/announcements/' + this.get('id') + '/firehose.json',
        message: function(json){
          model.set('content', json.announcement.content);
        }
      }).connect();
    }
  }.observes('isLoaded')
});