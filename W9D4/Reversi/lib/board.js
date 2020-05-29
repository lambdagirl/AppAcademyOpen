let Piece = require('./piece');

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid() {
  const grid = [];
  for (let i = 0; i < 8; i++) {
    let row = new Array(8);
    grid.push(row);
  }
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board() {
  this.grid = _makeGrid();
}

Board.DIRS =
    [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function(pos) {
  return (pos[0] < 8 && pos[0] >= 0) && (pos[1] < 8 && pos[1] >= 0)
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function(pos) {
  if (!this.isValidPos(pos)) {
    throw new Error('position is invalid')
  }
  return this.grid[pos[0], pos[1]]
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function(pos, color) {
  const piece = this.getPiece(pos)
  return piece && piece.color == color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function(pos) {
  return !!this.getPiece(pos)
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding
 * another piece of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip) {
  if (!piecesToFlip) {
    piecesToFlip = [];
  } else {
    piecesToFlip.push(pos);
  }

  let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (!this.isValidPos(nextPos) ||(!this.isOccupied(nextPos)) {
    return [];
    }
  else{
    return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
    }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function(pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }

  for (let i = 0; i < Board.DIRS.length; i++) {
    const piecesToFlip = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (piecesToFlip.length) {
      return true;
    }
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function(pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error('invalid move!')
  } else {
    let positionsToFlip = [];
    for (let i = 0; i < Board.DIRS.length; i++) {
      positionsToFlip = positionsToFlip.concat(
          this._positionsToFlip(pos, color, Board.DIRS[i] || []));
    }
    for (let i = 0; i < positionsToFlip.length; i++) {
      this.getPiece(positionsToFlip[i]).flip();
    }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function(color) {
  const validMovesArray=[];
  for(let i=0;i<8;i++){
    for (let j=0;j<8;j++){
      if (this.validMove([i,j],color)){
        validMovesArray.push([i,j])
      }
    }
  }
  return validMovesArray;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function(color) {
  return this.validMoves(color).length !==0;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function() {
  return !this.hasMove('white') && !this.hasMove('black');
};



/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < 8; i++) {
    let rowString = ' ' + i + ' |';

    for (let j = 0; j < 8; j++) {
      let pos = [i, j];
      rowString +=
        (this.getPiece(pos) ? this.getPiece(pos).toString() : '.');
    }

    console.log(rowString);
  }
};



module.exports = Board;
