// Stores a Game instance.
// Stores a canvas context to draw the game into.
// Installs key listeners to move the ship and fire bullets.
// Installs a timer to call Game.prototype.step.

function GameView(game,ctx){
    this.ctx = ctx;
    this.game = game;
}
GameView.MOVES = {
    w:[0,-1],
    a:[-1,0],
    s:[0,1],
    d:[1,0],
}

