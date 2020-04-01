//let c = new GraphNode("c");
class GraphNode {
    constructor(val){
        this.val = val;
        this.neighbors =[]
    }
}

let a = new GraphNode("a");
let b = new GraphNode("b");
let c = new GraphNode("c");
let d = new GraphNode("d");
let e = new GraphNode("e");
let f = new GraphNode("f");

a.neighbors = [b,c,e];
c.neighbors = [b,d];
e.neighbors = [a];
f.neighbors = [e];

//adjacency matrix
let matrix = [
    /*          A       B       C       D       E       F   */
    /*A*/    [true,  true,   true,   false,  true,   false],
    /*B*/    [false, true,   false,  false,  false,  false],
    /*C*/    [false, true,   true,   true,   false,  false],
    /*D*/    [false, false,  false,  true,   false,  false],
    /*E*/    [true,  false,  false,  false,  true,   false],
    /*F*/    [false, false,  false,  false,  true,   true]
    ];
//matrix[j][i] may != matrix[i][j]
//matrix[x][x]  === true for any x

//advantage:  allow us to refer to the entire graph by simply referring the 2D array.
//disadvanage: n^2  space required.


//adjaccency list; solve the shortcomimg of the matrix implementation
let graph = {
    'a':['b','c','e'],
    'b':[],
    'c': ['b', 'd'],
    'd': [],
    'e': ['a'],
    'f': ['e']
}
//An adjacency list is easy to implement and allows us to refer to the entire graph by simply referencing the object.
//space: number of egdes in the graph