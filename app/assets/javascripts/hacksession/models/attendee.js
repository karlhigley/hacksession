HackSession.Attendee = DS.Model.extend({
  person: DS.attr('string'),
  project: DS.attr('string'),
  useHelp: DS.attr('string'),
  couldHelp: DS.attr('string'),
  firehoseStream: null,
  setupFirehose: function() {
    if (this.get('isLoaded') == true){
      model = this;
      this.firehoseStream = new Firehose.Consumer({
        uri: '//localhost:7474/attendees/' + this.get('id') + '/firehose.json',
        message: function(json){
          model.set('person', json.attendee.person);
          model.set('project', json.attendee.project);
          model.set('useHelp', json.attendee.useHelp);
          model.set('couldHelp', json.attendee.couldHelp);
        }
      }).connect();
    }
  }.observes('isLoaded')
});