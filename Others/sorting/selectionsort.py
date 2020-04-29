def selection_sort(array):
    for i in range(len(array)):
        min_index = i
        for j in range(i+1,len(array)):
            if array[j] < array[min_index]:
                min_index = j
        if min_index != i:
            array[i], array[min_index] = array[min_index], array[i]

array = [2,4,43,24,1,54,6]
selection_sort(array)
for i in range(len(array)):
    print(array[i])