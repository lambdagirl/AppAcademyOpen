// ============================================================================
// Implementation Exercise: Stack
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Stack and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
    constructor(val){
        this.value = val
        this.next = null
    }
}

class Stack {
    constructor(){
        this.top = null
        this.bottom = null
        this.length = 0
    }
    push(val){
        const new_node = new Node(val)
        if (this.length <1){
            this.top = new_node
            this.bottom = new_node
        } else {
            const temp = this.top 
            this.top = new_node
            this.top.next = temp
        }
        return this.length +=1
    }
    pop(){
        if (!this.top){
            return null
        }
        const temp = this.top
        if (this.top == this.bottom){
            this.bottom = null
        }
        this.top = this.top.next;
        this.length -=1
        return temp.value
    }
    size(){

        return this.length

    }

}

exports.Node = Node;
exports.Stack = Stack;
