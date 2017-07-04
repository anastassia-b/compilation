const View = require('./ttt-view');
const Game = require('../node_ttt/game');

$( () => {
  const boardEl = $('.ttt');
  const game = new Game();
  new View(game, boardEl);
});
