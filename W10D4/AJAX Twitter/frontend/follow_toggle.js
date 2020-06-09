class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.useId = this.$el.data("user-id") || options.userId;
    this.followState =
    this.$el.data("intial-follow-state") || options.followState;
    debugger;

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

  handleClick(e) {
    e.preventDefault();
    this.followState = 
  }

}

module.exports = FollowToggle;