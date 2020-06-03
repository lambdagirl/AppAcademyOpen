// Base class for anything that moves.
// Most important methods are MovingObject.prototype.move, MovingObject.prototype.draw(ctx), MovingObject.prototype.isCollidedWith(otherMovingObject).
function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}
MovingObject.prototype.draw = function draw(ctx){
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2*Math.PI,
        true
        );
    ctx.fill();
};
MovingObject.prototype.move = function move() {
    this.pos =[this.pos[0] + this.vel[0], this.pos[1]+ this.vel[1]];
};


module.exports =MovingObject;

