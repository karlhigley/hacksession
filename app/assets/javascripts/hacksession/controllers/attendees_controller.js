HackSession.AttendeesController = Ember.ArrayController.extend({
  firehoseStream: null,
  setupFirehose: function() {
    controller = this;
    this.firehoseStream = new Firehose.Consumer({
      uri: '//localhost:7474/attendees/firehose.json',
      message: function(json){
        var existingAttendee = controller.findProperty('id', json.attendee.id);
        if (existingAttendee) {
          existingAttendee.set('person', json.attendee.person);
          existingAttendee.set('project', json.attendee.project);
          existingAttendee.set('useHelp', json.attendee.use_help);
          existingAttendee.set('couldHelp', json.attendee.could_help);
        } else {
          HackSession.Attendee.find(json.attendee.id);
        }
      }
    }).connect();
  }
});