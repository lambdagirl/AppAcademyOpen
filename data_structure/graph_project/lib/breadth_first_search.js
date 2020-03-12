function breadthFirstSearch(startingNode, targetVal) {
    let visited = new Set();
    let queue = [startingNode];
    while (queue.length){
        node = queue.shift()
        if (visited.has(node.val)) continue;
        if (targetVal == node.val) return node;
        visited.add(node.val);
        queue.push(...node.neighbors);
    }
    return null;
}

module.exports = {
    breadthFirstSearch
};