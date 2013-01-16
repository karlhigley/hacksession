//= require_self
//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./templates
//= require_tree ./routes

HackSession = Ember.Application.create({
  defaultContent: 'HackSession application default announcement content'
});

HackSession.Announcement = DS.Model.extend({
  content: DS.attr('string')
});

HackSession.AnnouncementsController = Ember.ArrayController.extend();

HackSession.AnnouncementView = Ember.View.extend({
  templateName: 'announcement'
});

$(function() {
  HackSession.store = HackSession.Store.create();

  var announcementsController = HackSession.AnnouncementsController.create({
    content: HackSession.Announcement.find()
  });
  console.log(announcementsController);

  var announcementView = HackSession.AnnouncementView.create({
    controller: announcementsController
  });
  console.log(announcementView);

  announcementView.appendTo('.announcement .content');
});