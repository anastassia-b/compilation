const Game = require('./game.js');
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let game = new Game();
game.run(reader, completion);

function completion() {
  reader.question("Play again? y or n: ", restartGame => {
    if (restartGame === 'y') {
      game = new Game();
      game.run(reader, completion);
    } else {
      reader.close();
    }
  });
}
