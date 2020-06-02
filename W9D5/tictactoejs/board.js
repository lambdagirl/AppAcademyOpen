// The board should have functions like Board.won(), Board.winner();, Board.empty(pos);, Board.place_mark(pos, mark), etc.

class Board {
  constructor() {
    this.grid = Array.from(new Array(3), () =>
      Array.from(new Array(3), () => null)
    );
  }
  isEmpty(pos) {
    const [r, c] = pos;
    return this.grid[r][c] === null;
  }
  won() {
    if (this.winner() != null) {
      return true;
    }
    return false;
  }
  winner() {
    let winner ;
    const results = this.cols().concat(this.diagonals()).concat(this.grid);
    //TODO
    results.forEach((line) => {
      if (line.every((v)=>v ===line[0])){
        winner = line[0];
      }
    });
    return winner;
  }

  place_mark(pos, mark) {
    const [r, c] = pos;
    if (this.isEmpty(pos)) {
      this.grid[r][c] = mark;
    } else {
      throw new Error("Is not and empty position!");
    }
  }

  cols() {
    return this.grid[0].map((_, colIndex) =>
      this.grid.map((row) => row[colIndex])
    );
  }

  diagonals() {
    const diagonals1 = [[], [], []];
    const diagonals2 = [[], [], []];
    const len = this.grid.length;
    for (let i = 0; i < len; i++) {
      diagonals1[i] = this.grid[i][i];
      diagonals2[i] = this.grid[i][len - 1 - i];
    }
    return [diagonals1, diagonals2];
  }
}

Board.marks = ["x", "o"];
module.exports = Board;
