class Node {
    constructor(val) {
        this.value = val;
        this.next = null;
        this.prev = null
    }
}

class DoubleLinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    addToTail(val) {
        const newNode = new Node(val);
        if (!this.head) {
            this.head = newNode;
            this.tail = newNode;
        } else {
            let currentTail = this.tail
            currentTail.next = newNode;
            this.tail = newNode;
            this.tail.prev = currentTail;
        }
        this.length++;
        return this;
    }

    removeTail() {
        if (!this.head) return undefined;
        let temp = this.tail;
        this.tail = temp.prev;
        this.tail.next = null;
        this.length --;
        return temp;
    }
}
const linkedList = new DoubleLinkedList();

linkedList.removeTail();

console.log(linkedList)