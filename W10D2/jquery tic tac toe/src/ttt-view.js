class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard()
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    const $ul = $("<ul></ul>");

    for (let r = 0; r < 3; r++){
      for (let c = 0; c < 3; c++){
        let $li = $("<li></li");
        $li.data("pos", [r,c]);
        $ul.append($li);
      }
    }
    this.$el.append($ul)
  }
}

module.exports = View;
