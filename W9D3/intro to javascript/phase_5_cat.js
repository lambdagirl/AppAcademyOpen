function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  console.log(this.owner + ' loves ' + this.name)
};

Cat.prototype.meow = function() {
  console.log('meow!')
};

c1 = new Cat('Ruby', 'Ken');
c1.cuteStatement();

Cat.prototype.cuteStatement = function() {
  console.log(
      'Everyone' +
      ' loves ' + this.name)
};
c1.cuteStatement();
c1.meow();

c2 = new Cat('Erika', 'Zen');

c2.meow = function() {
  console.log('purr');
};
c2.meow();
