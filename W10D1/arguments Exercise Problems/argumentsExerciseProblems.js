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
