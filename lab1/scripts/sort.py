import itertools
import random
def compare(a,b,mod= False):
    if (a[1]<=b[1]):
        return a,b
    else:
        return b,a
#num_array = [i for i in range(0,7)]
#num_array = [0,6,-8,5,0,-8,-7]
num_array = []

for i in range(7):
    num_array.append(random.randint(0,1))
num_array_sorted = sorted(num_array)
#print(num_array)
error_count = 0
r = itertools.permutations(num_array)
def takeSecond(elem):
    return elem[1]

for i in r:
    list_type_input_ = list(i)
    list_type_input = []
    for j in range(7):
        pack = [j,list_type_input_[j]]
        list_type_input.append(pack)


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
    #print("sort1: {}".format(sort1))
    #print("sort2: {}".format(sort2))
    #print("---------")
    
    #####4 input from: 11, 17, 18, 14| 15, 16, 10
    temp_19, temp_20 = compare(temp_11,temp_15) #10  [0]f
    temp_21, temp_22 = compare(temp_14,temp_10) #11  [6]b

    temp_23, temp_24 = compare(temp_20,temp_17) #12
    temp_25, temp_26 = compare(temp_16,temp_21) #13  
    
    temp_27, temp_28 = compare(temp_24,temp_25) #14
    temp_29, temp_30 = compare(temp_18,temp_26) #15 [5]b
    temp_31, temp_32 = compare(temp_23,temp_27) #16 [1]f 
    temp_33, temp_34 = compare(temp_28,temp_29) #17 [4]b
    temp_35, temp_36 = compare(temp_32,temp_33) #18 [2],[3]
    """
    #####6
    temp_31, temp_32 = compare(temp_26,temp_27)
    temp_33, temp_34 = compare(temp_28,temp_29)
    temp_35, temp_36 = compare(temp_30,temp_24)
    #####7
    temp_37, temp_38 = compare(temp_25,temp_31)
    temp_39, temp_40 = compare(temp_32,temp_33)
    temp_41, temp_42 = compare(temp_34,temp_35)
    
    
    result = [temp_37,temp_38,temp_39,temp_40,temp_41,temp_42,temp_36] #[temp_37,temp_38,temp_32,temp_33,temp_34,temp_35,temp_36]
    for index in range(7):
        index_ = 3#index   5 6
        if result[index_] != num_array[index_]:
            error_count +=1 
            print("error #{}".format(error_count))
            print("input: {}".format(list_type_input))
            print("result: {}".format(result))
            print("ans: {}".format(num_array))
            print("---------------")
   """
    
    result = [temp_19,temp_31,temp_35,temp_36,temp_34,temp_30,temp_22] #[temp_37,temp_38,temp_32,temp_33,temp_34,temp_35,temp_36]
    ans = sorted(list_type_input,key=takeSecond)
    for index in range(7):
        index_ =3#index   #5 6
        if (result[index_][1] != ans [index_][1]) or(result[index_][0] != ans [index_][0]):
            error_count +=1 
            print("error #{}".format(error_count))
            print("input: {}".format(list_type_input))
            print("result: {}".format(result))
            print("ans: {}".format(ans))
            print("---------------")
            break



print("pass")

    #print(result)
    


    #print(sorted(c))
    #for j in range(7):
    #    print(i[j])
"""

for i in r:
    for j in range(7):
        print(i[j])
    count+=1
print(count)
"""

list_type_input = [[0,1],[1,4],[2,3],[3,2],[4,3],[5,0]]
list_type_input=sorted(list_type_input,key=takeSecond,reverse=True)
print(list_type_input)