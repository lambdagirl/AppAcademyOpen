class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (event) => {
      const $square = $(event.currentTarget);
      this.makeMove($square);
    });
  }

  makeMove($square) {
    const pos = $square.data("pos");
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (e) {
      alert("This " + e.msg.toLowerCase());
      return;
    }

    $square.addClass(currentPlayer);

    if (this.game.isOver()){
      this.$el.off("click");
      this.$el.addClass("gameover");

      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");

      if (winner){
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}!`);

      }else{
        $figcaption.html("this is a draw!");
      }

      this.$el.append($figcaption);
    }

  }

  setupBoard() {
    const $ul = $("<ul></ul>");

    for (let r = 0; r < 3; r++) {
      for (let c = 0; c < 3; c++) {
        let $li = $("<li></li");
        $li.data("pos", [r, c]);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
