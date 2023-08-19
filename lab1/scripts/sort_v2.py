import itertools
def compare(a,b):
    if (a<=b):
        return a,b
    else:
        return b,a
num_array = [i for i in range(0,7)]

#print(num_array)
error_count = 0
r = itertools.permutations(num_array)


for i in r:
    list_type_input = list(i)
    #####1
    temp_1 ,temp_2 = compare(list_type_input[0],list_type_input[1]) #1
    temp_3 ,temp_4 = compare(list_type_input[2],list_type_input[3]) #2
    
    temp_5 ,temp_6 = compare(list_type_input[4],list_type_input[5]) #3
    #####2
    temp_7, temp_8 = compare(temp_2,temp_3) #4
    
    temp_9, temp_10 = compare(temp_6,list_type_input[6]) #5
    #####3
    temp_11, temp_12 = compare(temp_1,temp_7) #6
    temp_13, temp_14 = compare(temp_8,temp_4) #7    
    
    temp_15, temp_16 = compare(temp_5,temp_9) #8    

    temp_17, temp_18 = compare(temp_12,temp_13) #9
    sort1 = [temp_11,temp_17,temp_18,temp_14]
    sort2 = [temp_15,temp_16,temp_10]
    sort1_ans = sorted([list_type_input[0],list_type_input[1],list_type_input[2],list_type_input[3]])

    for index in range(0,4):
        index_ = index   #5 6
       
        if sort1[index_] != sort1_ans[index_]:
            error_count +=1 
            print("error #{} in sort1".format(error_count))
            print("input: {}".format(list_type_input))
            print("result: {}".format(sort1))
            print("ans: {}".format(sort1_ans))
            print("---------------")
            break
    sort2_ans = sorted([list_type_input[4],list_type_input[5],list_type_input[6]])
    for index in range(3):
        index_ = index   #5 6
        if sort2[index_] != sort2_ans[index_]:
            error_count +=1 
            print("error #{} in sort2".format(error_count))
            print("input: {}".format(list_type_input))
            print("result: {}".format(sort2))
            print("ans: {}".format(sort2_ans))
            print("---------------")
            break
print("pass")