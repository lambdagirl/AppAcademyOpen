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
      if(this.winner()!=null){
        return true;
      }
  }
  winner() {
    results = this.cols.concat(this.diagonals).concat(this.rows);
    results.forEach((line)=>{
        if (line == ["x", "x", "x"]) {
          return "x";
        } 
        else if (line == ["o", "o", "o"]) {
            return 'o';
        } else{
            return null;
        }
    });
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
    const cols = Array.from(new Array(3), () => null);
    this.grid.forEach((row) => {
      row.forEach((mark, i) => {
        cols[i] = mark;
      });
    });
    return cols;
  }

  diagonals() {
    const diagonals1 = [[],[],[]];
    const diagonals2 = [[], [], []];
    len = grid.length;
    for (let i = 0; i < len; i++) {
      diagonals1[i] = grid[i][i];
      diagonals2[i] = grid[i][len - 1 - i];
    }
    return [diagonals1, diagonals2];
  }
}



Board.marks =['x','o'];
mudule.exports = Board;



