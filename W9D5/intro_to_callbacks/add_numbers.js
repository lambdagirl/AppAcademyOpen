const readline = require('readline');
const reader = readline.createInterface({
    input : process.stdin,
    output: process.stdout
});

function addNumbers(sum,numsLeft, completionCallback){
    if(numsLeft > 0){
        reader.question("What's the number?", function(numString){
            const num1 = parseFloat(numString);
            sum = sum+num1;
            console.log("Partial sum: " + sum);
            addNumbers(sum,numsLeft-1,completionCallback);
        });
    } else {
    //pass the total sum to a callback when done.
    completionCallback(sum);
  }
}
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
