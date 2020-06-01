function sum(){
    let total = 0;
    for (let i = 0; i < arguments.length; i++){
        total += arguments[i];
    }
    return total;
}

function sum1(...nums) {
  let total = 0;
  nums.forEach((num)=>{
      total+=num;
  });
  return total;
}

Function.prototype.myBind1 = function(ctx){
    const fn = this;
    const bindArgs = Array.from(arguments).slice(1);
    return function _boundFn(){
        const callArgs = Array.from(arguments);
        return fn.apply(ctx,bindArgs.concat(callArgs));
    };
};

Function.prototype.myBind2 = function(ctx, ...bindArgs){
    return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
};

function curriedSum(numArgs){
    const nums=[];

    function _curriedSum(num) {
        nums.push(num);
        if (nums.length === numArgs){
            let total = 0;
            nums.forEach((n)=>{total += n;});
            return total;
        } else{
            return _curriedSum;
        }
    }
    return _curriedSum;
}
const sumCurry = curriedSum(4);
sumCurry(5)(30)(20)(1); // => 56
//_curriedSum keeps collecting arguments and returning itself until it has enough arguments, at which point it actually does the required work of summing.

Function.prototype.curry1 = function(nArg){
    const argArray =[];
    const _curriedFn =(arg) => {
        argArray.push(arg);
        if (argArray.length === nArg){
            return this(...argArray);
        } else{
            return _curriedFn;
        }
    };
    return _curriedFn;
}

