HackSession.Attendee = DS.Model.extend({
  person: DS.attr('string'),
  project: DS.attr('string'),
  useHelp: DS.attr('string'),
  couldHelp: DS.attr('string'),
  firehoseStream: null,
  setupFirehose: function() {
    if (this.get('isLoaded') == true){
      model = this;
      model.firehoseStream = new Firehose.Consumer({
        uri: '//localhost:7474/attendees/' + model.get('id') + '/firehose.json',
        message: function(json){
          model.set('person', json.attendee.person);
          model.set('project', json.attendee.project);
          model.set('useHelp', json.attendee.use_help);
          model.set('couldHelp', json.attendee.could_help);
        }
      }).connect();
    }
  }.observes('isLoaded')
});