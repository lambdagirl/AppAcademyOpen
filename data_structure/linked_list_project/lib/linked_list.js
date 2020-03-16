// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
        this.value = val;
        this.next = null;
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
        const new_node = new Node(val)
        if(!this.head){
            this.head = new_node
        } else {
            this.tail.next = new_node
        }
        this.tail = new_node
        this.length+=1
        return this
    }


    removeTail() {
        if (!this.head) return undefined;
        let current = this.head;
        let newTail = current;
        while (current.next) {
            newTail = current
            current = current.next;
        }
        this.tail = newTail;
        this.tail.next = null;
        this.length--;
        if (this.length === 0) {
            this.head = null;
            this.tail = null;
        }
        return current;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
        const new_node = new Node(val)
        if (!this.head){
            this.head = new_node
            this.tail = new_node
        } else{
            new_node.next = this.head
            this.head = new_node
        }
        this.length+=1
        return this
    }

    // TODO: Implement the removeHead method here
    removeHead() {
        if (!this.head) return undefined;
        const currentHead = this.head;
        if (this.head.next){
            this.head = currentHead.next;
        } else {
            this.head = null;
            this.tail = null;
        }
        this.length -=1;
        return currentHead
    }

    // TODO: Implement the contains method here
    contains(target) {
        let node = this.head;
        while (node) {
            if(node.value === target) return true;
            node = node.next; 
        }
        return false
    }

    // TODO: Implement the get method here
    get(index) {

    }

    // TODO: Implement the set method here
    set(index, val) {

    }

    // TODO: Implement the insert method here
    insert(index, val) {

    }

    // TODO: Implement the remove method here
    remove(index) {

    }

    // TODO: Implement the size method here
    size() {

    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
