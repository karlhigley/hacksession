//= require handlebars
//= require ember
//= require ember-data
//= require firehose
//= require_tree ../markdown
//= require_self
//= require ./store
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./templates
//= require_tree ./routes

HackSession = Ember.Application.create({
  markdownConverter: new Markdown.Converter()
});

$(function() {
  HackSession.store = HackSession.Store.create();
  var announcementsController = HackSession.AnnouncementsController.create({
    content: HackSession.Announcement.find()
  });
  var announcementView = HackSession.AnnouncementView.create({
    controller: announcementsController
  });
  announcementView.appendTo('.announcement .content');
});