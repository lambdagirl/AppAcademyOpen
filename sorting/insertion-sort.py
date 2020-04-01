
def insertionSort(array):
    for j in range(1, len(array)):
        key = array[j]
        i = j-1
        while i > 0 and array[i] > key:
            array[i+1] = array[i]
            i = i-1
        array[i+1] = key
    return array

print(insertionSort([21,332,45,67,86]))

Merge(A,p,q,r)
    n1 = q-p+1
    n2 = r-q
    let L[1...n1+1] and R[1..n2+1] to be new arrays 
    for i = 1 to n1
        L[i] = A[p+i-1]
    for j = 1 to n2
        R[j] = A[q+j]
    L[n1+1] = ∞
    R[n2+1] = ∞
    i = 1
    j = 1
    for k = p to r
        if L[i] < R[j]
            A[k] = L[i]
            i = i+1
        else A[k] = R[j]
            j = j + 1
    
Merge-Sort(A,p,r)
    if p < r 
        q = [(p+r)/2]
        Merge-Sort(A,p,q)
        Merge-Sort(A,q+1,r)
        Merge(A,p,q,r)
