//所谓遍历(Traversal)，是指沿着某条搜索路线，依次对树（或图）中每个节点均做一次访问。

//Graph Traversal w/ GraphNode

class GraphNode {
    constructor(val){
        this.val = val;
        this.neighbors =[]
    }
}

let a = new GraphNode('a')
let b = new GraphNode('b');
let c = new GraphNode('c');
let d = new GraphNode('d');
let e = new GraphNode('e');
let f = new GraphNode('f');
a.neighbors = [e, c, b];
c.neighbors = [b, d];
e.neighbors = [a];
f.neighbors = [e];

//recursion version
//broken
function depthFirstRecur1(node){
    console.log(node.val);
    node.neighbors.forEach(neighbor =>depthFirstRecur1(neighbor))
}
depthFirstRecur1(f)
//f, e, a, e, a, e, a, e, ...
// To fix this, simply store which nodes we have visited already. 


function depthFirstRecur(node, visited = new Set()){
    //if this node has already been visited, them return early.
    if (visited.has(node.val)) return; 
    //otherwise it hasn't yet been visit,
    //print the value and mark as visited.
    console.log(node.val);
    visited.add(node.val);

    //then explore each of it's neighbors
    node.neighbors.forEach(neighbor => depthFirstRecur(neighbor, visited))
}
depthFirstRecur(f)

//iterative version
function depthFirstInter(node){
    let visited = new Set()
    let stack = [node]

    while (stack.length > 0){
        node = stack.pop()
        if (visited.has(node.val)) continue;
        console.log(node.val)
        visited.add(node.val);
        // then add it's neighbors to the stack to be explored
        stack.push(...node.neighbors);
    }
}
depthFirstRecur2(f)
//f,e,a,c,b,d


//Graph Traversal w/ Adjacency List
let graph = {
    'a':['b','c','e'],
    'b':[],
    'c': ['b', 'd'],
    'd': [],
    'e': ['a'],
    'f': ['e']
}
function depthFirstRecur2(node,graph,visited = new Set()){
    if (visited.has(node.val)) return;
    console.log(node.val);
    visited.add(node.val);

    graph[node].forEach(neighbor => depthFirstRecur3(node,graph,visited))
}

//iterative version
function depthFirstInter2(node,graph){
    let visited = new Set()
    let stack = [node]

    while (stack.length){
        node = stack.pop()

        if (visited.has(node.val)) return;
        console.log(node.val);
        visited.add(node.val)

        stack.push(...graph[node])
    }

}

/* facotry code */
function depthFirst(graph){
    let visited = new Set()
//allow us to "bridge" the gap between connection regions.
    for (node in graph){
        _depthFirstRecur3(node,graph,visited);
    }
}
function _depthFirstRecur3(node,graph,visited){
    if (visited.has(node.val)) return;
    console.log(node.val);
    visited.add(node.val);

    graph[node].forEach(neighbor => depthFirstRecur3(neighbor,graph,visited))
}
