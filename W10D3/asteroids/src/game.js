// Holds collections of the asteroids, bullets, and your ship.
// Game.prototype.step method calls Game.prototype.move on all the objects, and Game.prototype.checkCollisions checks for colliding objects.
// Game.prototype.draw(ctx) draws the game.
// Keeps track of dimensions of the space; wraps objects around when they drift off the screen.

function Game() {
    this.asteroids  = [];
    this.bullets    = [];
    this.ships      = [];

    this.addAsteroids();
}

Game.BG_COLOR = "#000000";
Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;
Game.prototype.addAsteroids = function add(object) {
    if (object instanceof Asteroid){
        this.asteroids.push(object);
    }else if (object instanceof Bullets){
        this.bullets.push(object);
    }else if (object instanceof Ship){
        this.ships.push(object);
    } else{
        throw new Error("unknow type of obkect");
    }
};

Game.prototype.randomPosition = function randomPosition() {
    return [
        Game.DIM_X * Math.random(),
        Game.DIM_Y * Math.random()
    ];
};

Game.prototype.draw = function draw(ctx) {
    ctx.clearRect(0,0,Game.DIM_X, Game.DIM_Y);
    ctx.fillStyle = Game.BG_COLOR;
    ctx.fillRec(0,0,Game.DIM_X,Game.DIM_Y);
    this.asteroids.forEach(function(asteroid) {
      asteroid.draw(ctx);
    });
};

Game.prototype.moveObjects = function moveObject(delta) {
    this.asteroids.forEach(function(asteroid) {
        asteroid.move(delta);
    });
};