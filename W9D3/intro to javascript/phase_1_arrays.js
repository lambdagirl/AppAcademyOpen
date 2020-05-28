Array.prototype.uniq = function() {
  let uniqueArray = [];

  for (let i = 0; i < this.length; i++) {
    if (uniqueArray.indexOf(this[i]) === -1) {
      uniqueArray.push(this[i]);
    }
  }
  return uniqueArray
};
console.log([1, 1, 2, 2, 3, 3, 4, 4, 5, 5].uniq());


Array.prototype.twoSum = function() {
  const pairs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = (i + 1); j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([this[i], this[j]]);
      }
    }
  }
  return pairs
};
console.log([-1, 0, 2, 1, -2].twoSum());
Array.prototype.twoSum2 =
    function() {
  const pairs = [];
  const dictIndex = {};
  this.forEach((el, idx) => {
    if (dictIndex[-el]) {
      const newPair = dictIndex[-el].map((prevIdx) => [prevIdx, idx])
      pairs = pairs.concat();
    }
    dictIndex[el] ? dictIndex[el].push(idx) : dictIndex[el] = [idx]
  });
  return pairs
}

    Array.prototype.transpose = function() {
  const columns = Array.from(
      {length: this[0].length}, () => Array.from({length: this.length}));
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      columns[j][i] = this[i][j];
    }
  };
  return columns;
};
console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());
