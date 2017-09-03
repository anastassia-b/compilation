const Circle = require("./circle");

const circles = [];

class Game {

  constructor(xDim, yDim) {
    this.xDim = xDim;
    this.yDim = yDim;

    for (let i = 0; i < Game.NUM_CIRCLES; i++) {
      circles.push(
        Circle.randomCircle(xDim, yDim, Game.NUM_CIRCLES)
      );
    }
  }

  render(ctx) {
    ctx.clearRect(0, 0, this.xDim, this.yDim);

    circles.forEach(function (circle) {
      circle.render(ctx);
    });
  }

  moveCircles() {
    circles.forEach( circle => {
      circle.moveRandom(this.xDim, this.yDim);
    });
  }

  start(canvasEl) {
    const ctx = canvasEl.getContext("2d");

    const animateCallback = () => {
      this.moveCircles();
      this.render(ctx);

      requestAnimationFrame(animateCallback);
    };

    animateCallback();
  }

}

Game.NUM_CIRCLES = 5000;

module.exports = Game;
