# This scripts calculate how many ops should be place to solve 16 parallel GLCM problem.
'''
sum =0
for i  in range(120):
    
    for j in range(i+1,16):
        print("{}|{}|{}".format(sum+j-1,i,j))
    print("sum: {}".format(sum))
    sum = sum + 15-(i+1)
'''
"""
sum = 0
add = 15
count = 0
for i in range(15):
    for j in range(i+1,16):
        
        if i == 0 :
            print("{}|{}|{}".format(j-1,i,j))    
        else:
            print("{}|{}|{}".format(sum-i+j-1,i,j))
            if(count!=(sum-i+j-1)):
                print("fail")
        
        count = count +1
    
    sum = sum + add
    add = add -1
"""

sum = 0
add = 15
count = 0
for i in range(15):
    for j in range(i+1,16):
        
        if((j==i+1)):
            #print("{}|{}|{}".format((120-((15-i)*(16-i)/2))-i+j-1,i,j))
            print((120-((15-i)*(16-i)/2))-i-1)
        if(count!=((120-((15-i)*(16-i)/2))-i+j-1)):
            
            print("fail")
        
        count = count +1
    
