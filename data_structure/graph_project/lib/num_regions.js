function numRegions(graph) {
    let visited = new Set();
    let region = 0;
    //allow us to "bridge" the gap between connection regions.
    for (node in graph){
        if (isNewRegion(node,graph,visited)) region+=1;
    }
    return region
}
function isNewRegion(node, graph, visited) {
    if (visited.has(node)) return false;
    visited.add(node);
    graph[node].forEach(neighbor => isNewRegion(neighbor,graph,visited));
    return true
}



module.exports = {
    numRegions
};