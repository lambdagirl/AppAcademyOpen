//Bianry search trees

//1.given any node of the tree, the values in the left subtree must all be strictly less than the given node's value.
//2. the values in the right subtree must All be greater than or equal to the given node's value

//A BST is a Sorted Data Structure

//In-Order
function inOrderPrint(root){
    if(!root) return;

    inOrderPrint(root.left);
    console.log(root.val);
    inOrderPrint(root.right);
}


//A Binary Tree is a Tree where nodes have at most 2 children.

//TreeNode
class TreeNode{
    constructor(val){
        this.val = val
        this.left = null
        this.right = null
    }
}

let a = new TreeNode('a');
let b = new TreeNode('b');
let c = new TreeNode('c');
let d = new TreeNode('d');
let e = new TreeNode('e');
let f = new TreeNode('f');

a.left = b;
a.right = c;
b.left = d;
b.right = e;
c.right = f;