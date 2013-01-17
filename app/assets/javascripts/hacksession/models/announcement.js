HackSession.Announcement = DS.Model.extend({
  content: DS.attr('string'),
  markdownContent: function () {
    return HackSession.markdownConverter.makeHtml(this.get('content'));
  }.property()
});