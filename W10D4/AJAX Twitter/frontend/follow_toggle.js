class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id') || options.userId;
    this.followState = (this.$el.data('initial-follow-state') ||
                        options.followState);
    this.render();
  }

  render() {
    let btnText;
    switch (this.followState) {
      case "followed":
        btnText = "Unfollow!";
        break;
      case "unfollowed":
        btnText = "follow!";
        break;
    }
    this.$el.html(btnText);
  }


}

module.exports = FollowToggle;