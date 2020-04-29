def quick_sort(array,low,high):
    if low < high:
        #q is partitioning index, array[p] is now at right place.
        q = partition(array,low,high)
        #separately sort elements before partition and after partition
        quick_sort(array,low,q-1)
        quick_sort(array,q+1,high)

def partition(array,low,high):
    x = array[high] #pivot
    i = low -1 #index of smaller element
    for j in range(low,high):
        if array[j] < x: #if current element is smaller than the pivot
            i = i+1 #increase index of the smaller number
            array[i],array[j] = array[j],array[i]
    #swap the pivot number to the middle
    array[i+1],array[high] = array[high],array[i+1]
    return (i+1)

array = [21,3,4,75,7,24,32,2]
quick_sort(array,0,len(array)-1)
for i in range(len(array)):
    print(array[i])