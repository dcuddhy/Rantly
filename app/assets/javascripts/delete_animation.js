deleteRant: function(rant) {
    var control = this;
    Ember.$('.delete-button').parents('.scroll').addClass('fadeOut');
    Ember.run.later(function(){
      rant.destroyRecord();
      control.transitionToRoute('rants');
    }, 400);
 }
