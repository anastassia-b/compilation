const APIUtil = require('./api_util');

class FollowToggle {
  constructor(el, options) {
    this.$el = $el;
    this.userId = this.$el.data('user-id') || options.userId;
    this.followState = (this.$el.data('initial-follow-state') || options.followState);

    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  handleClick(e) {
    const that = this;

    e.preventDefault();

    if (this.followState === 'followed') {

      APIUtil.unfollowUser(this.userId).then(() => {
        that.followState = 'unfollowed';
        that.render();
      });
    } else if (this.followState === 'unfollowed') {

      APIUtil.followUser(this.userId).then(() => {
        that.followState = 'followed';
        that.render();
      });
    }
  }

  render() {
    switch(this.followState) {
      case 'followed':
        this.$el.prop('disabled', false);
        this.$el.html('Unfollow!');
        break;
      case 'unfollowed':
        this.$el.prop('disabled', false);
        this.$el.html('Follow!');
        break;
    }
  }
}

module.exports = FollowToggle;
