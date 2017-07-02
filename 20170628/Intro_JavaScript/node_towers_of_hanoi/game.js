class Game {
  constructor() {
    this.towers = [[3, 2, 1], [], []];
  }

  isValidMove(startIdx, endIdx) {
    const startTower = this.towers[startIdx];
    const endTower = this.towers[endIdx];

    if (startTower.length === 0) {
      return false;
    } else if (endTower.length === 0) {
      return true;
    } else {
      return startTower[startTower.length - 1] < endTower[endTower.length - 1];
    }
  }

  isWon() {
    return (this.towers[2].length === 3 || this.towers[1].length === 3);
  }

  move(startIdx, endIdx) {
    if (this.isValidMove(startIdx, endIdx)) {
      this.towers[endIdx].push(this.towers[startIdx].pop());
      return true;
    } else {
      return false;
    }
  }

  print() {
    console.log(JSON.stringify(this.towers));
  }

  promptMove(reader, callback) {
    this.print();
    reader.question("Enter a starting tower: ", start => {
      const startIdx = parseInt(start);
      reader.question("Enter an ending tower: ", end => {
        const endIdx = parseInt(end);
        callback(startIdx, endIdx);
      });
    });
  }

  run(reader, gameCompletionCallback) {
    this.promptMove(reader, (startIdx, endIdx) => {
      if (!this.move(startIdx, endIdx)) {
        console.log("Invalid move!");
      }
      if (!this.isWon()) {
        this.run(reader, gameCompletionCallback);
      } else {
        this.print();
        console.log("You win!");
        gameCompletionCallback();
      }
    });
  }
}

module.exports = Game;
