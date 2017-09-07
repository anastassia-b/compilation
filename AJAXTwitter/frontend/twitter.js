const FollowToggle = require('./follow_toggle');
const UserSearch = require('./users_search');

$(() => {
  $('button.follow-toggle').each( (i, btn) => new FollowToggle(btn, {}));
  $('nav.users-search').each ( (i, search) => new UsersSearch(search));
}).
