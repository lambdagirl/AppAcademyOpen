console.log("Webpack is working!");

const MovingObject = require("./moving_object.js");
const Asteroid = require("./Asteroid.js");
window.MovingObject = MovingObject;

const mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00",
});

const a = new Asteroid({
  pos: [50, 50],
});
document.addEventListener("DOMContentLoaded", function () {
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.height = 800;
  canvasEl.width = 800;
  const ctx = canvasEl.getContext("2d");
  mo.draw(ctx);
  a.draw(ctx);
});
