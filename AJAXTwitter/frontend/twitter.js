const FollowToggle = require('./follow_toggle');

$(() => {
  $('button.follow-toggle').each( (i, btn) => new FollowToggle(btn, {}));
}).
