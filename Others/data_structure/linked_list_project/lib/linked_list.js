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
        if (index > this.length) return null;
        let counter =0;
        let current = this.head;
        while (counter!= index){
            current = current.next;
            counter += 1;
        }
        return current;

    }

    // TODO: Implement the set method here
    set(index, val) {
        const foundNode = this.get(index);
        if (foundNode){
            foundNode.value = val;
            return true
        }
        return false;
    }

    // TODO: Implement the insert method here
    insert(index, val) {
        if (index<0|| index>= this.length) return false;
        if (index === 0) return !!this.addToHead(val);

        const newNode = new Node(val);
        const previous = this.get(index -1);
        const next = previous.next;
        previous.next = newNode;
        newNode.next = next;
        this.length ++;
        return true;
    }

    // TODO: Implement the remove method here
    remove(index) {
        if (index < 0 || index > this.length) return undefined;
        if (index == 0) this.removeHead();
        if (index == this.length) this.removeTail;
        const previous = this.get(index -1);
        const current =  previous.next;
        previous.next = current.next;
        this.length --;
        return current
    }

    // TODO: Implement the size method here
    size() {
        return this.length;
    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
