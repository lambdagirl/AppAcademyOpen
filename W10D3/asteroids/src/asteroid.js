//Spacerock. It inherits from MovingObject.
const Util = require("./utils");
const MovingObject = require("./moving_object");

const DEFAULTS = {
  COLOR: "#505050",
  RADIUS: 25,
  SPEED: 4,
};
function Asteroid(options) {
  options = options || {};
  options.color = DEFAULTS.color;
  options.pos = options.pos;
  options.radius = DEFAULTS.RADIUS;
  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);

  MovingObject.call(this, options);
}
// Must inherit before adding any properties (usually functions) to the Asteroid prototype
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;

// Why do we still need to call MovingObject's constructor function from within Asteroid's constructor function?
// Our inherits function sets up the prototype inheritance chain,
//which makes methods available on the parent's prototype available to instances of the child class.
// However, we still need to call MovingObject's constructor function from within Asteroid's constructor function to access the code that sets properties such as this.pos and this.vel.
//Its the equivalent to calling super in a class's #initialize method in Ruby.
