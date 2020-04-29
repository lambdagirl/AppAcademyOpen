def bubblesort(A):
    for i in range(len(A)):
        for j in range(1,len(A)-i-1):
            if A[j+1] < A[j]:
                A[j+1],A[j] = A[j],A[j+1]
    return A
print(bubblesort([3,2,424,43,2]))