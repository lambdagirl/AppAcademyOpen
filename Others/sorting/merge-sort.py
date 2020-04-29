def merge(A,p,q,r):
    n1 = q - p + 1
    n2 = r - q 
    #create new array
    L = [0] * n1
    R = [0] * n2
    # copy array to L, and R
    for i in range(0,n1):
        L[i] = A[p + i] 
    for j in range(n1, n2):
        R[i] = A[q+j+1]
        
    