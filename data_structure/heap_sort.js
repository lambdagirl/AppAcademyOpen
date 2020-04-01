//heaps are a partially ordered data structure
//we can still leverage heaps in a sorting algorithm to end up with fully sorted array.

//1.build the heap: inseart all elements of the array into a MaxHeap
//2.construct the sorted list: continue to deleteMax until the heap is empty, every deletion will return the next element in decreasing order.

const { MaxHeap } = require('./heaps_project/lib/max_heap');

function heapSort1(array){
    //1.build the heap: 
        let heap = new MaxHeap();
    array.forEach(num => {
        heap.insert(num)
    });
    //2.construct the sorted list
    let sorted = [];
    while (heap.array.length > 1){
        sorted.push(heap.deleteMax());
    }
    return sorted;
}
//Time Complexity Analysis: O(nlog(n))
//Space Complexity Analysis O(n)

//In-place Heap Sort
function swap(array, i, j){
    [array[i],array[j]] = [array[j], array[i]];
}
// shift-down the node at index i until max heap property is restored
// n represents the size of the heap
function heapify(array, n, i) {
    let leftIdx = 2 * i + 1;
    let rightIdx = 2 * i + 2;

    let leftVal = array[leftIdx];
    let rightVal = array[rightIdx];

    if (leftIdx >= n) leftVal = -Infinity;
    if (rightIdx >= n) rightVal = -Infinity;

    if (array[i] > leftVal && array[i] > rightVal) return;

    let swapIdx;
    if (leftVal < rightVal) {
        swapIdx = leftIdx;
    } else {
        swapIdx = rightIdx;
    }
    swap(array, i, swapIdx);
    heapfity(array, n, swapIdx);
}

function heapSort(array){
    // heapify the tree from the bottom up;
    for (let i = array.length -1; i>=0; i--){
        heapify(array, array.length,i);
    }
    // the entire array is now a heap

    // until the heap is empty, continue to "delete max"
    for (let endOfHeap = array.length -1; endOfHeap > 0; endOfHeap--){
        swap(array, endOfHeap, 0);
        heapify(array, endOfHeap, 0)
    }
    return array;
}

