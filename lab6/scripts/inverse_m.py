
prime_table = [5,7,11,13,19,23,29,31,37,41,43,\
               47,53,59,61,67,71,73,79,83,89,\
                97,101,103,107,109,113,127]
prime_table_6 = [5,7,11,13,19,23,29,31,37,41,43,\
               47,53,59,61]


def Ext(a,b,itr_time):
    if a<b:
        a,b =b,a
    #print("a: {}".format(a))
    #print("b: {}".format(b))
    if(b==1):

        return [1, 0 , 1, itr_time]
    d1, s1, t1 ,itr_result= Ext(b,a%b, itr_time+1)
    d=d1
    s=t1
    t= s1 - (a//b)*t1
    return [d,s,t, itr_result]





in1 = 13
in2 = 7

print(Ext(in1,in2,0))


min_it_time = 999
max_it_time = 0
for prime in prime_table_6:
    min_it_time = 0
    max_it_time = 0
    for i in range(2,prime):
    #    print(i)

        it_time = 0
    
        d_test, s_test, t_test, iter_ = Ext(prime,i,it_time)

        if(d_test!=1 or (((i*t_test)%prime)!=1)):
            print("fail")
            break
        else:
            if(iter_>max_it_time):
                max_it_time = iter_
            if(iter_<min_it_time):
                min_it_time = iter_
        
        if(prime<=31 and iter_ >=5):
            print("5bitMAXi: {}".format(i))
            print("5bitMAXp: {}".format(prime))
            print("iter_: {}".format(iter_))
            print("======================")     
        
        if((prime<=61) and iter_ >=6):
            print("6bitMAXi: {}".format(i))
            print("6bitMAXp: {}".format(prime))
            print("iter_: {}".format(iter_))
            print(t_test)    
            print("======================")     
        
        if((prime<=127) and iter_ >=8):
            print("7bitMAXi: {}".format(i))
            print("7bitMAXp: {}".format(prime))
            print("iter_: {}".format(iter_))    
            print("======================")     
        
    """
    if(prime==13):
        print("4 bit:")
        print("Max_it: {}".format(max_it_time))
        print("Min_it: {}".format(min_it_time))
    if(prime==31):
        print("5 bit:")
        print("Max_it: {}".format(max_it_time))
        print("Min_it: {}".format(min_it_time))
    if(prime==61):
        print("6 bit:")
        print("Max_it: {}".format(max_it_time))
        print("Min_it: {}".format(min_it_time))
    if(prime==127):
        print("7 bit:")
        print("Max_it: {}".format(max_it_time))
        print("Min_it: {}".format(min_it_time))
    """




    def four_bit(in1, in2):
        if(in1>in2):
            B0, S0 = in1, in2
        else:
            B0, S0 = in2, in1
        B0_d = B0//S0
        B0_m = B0%S0
        B0_mn1 = B0_d * -1
        #layer1
        B1 = S0
        S1 = B0_m

        B1_d = B1//S1
        B1_m = B1%S1
        B1_result = B0_d * B1_d +1
        #layer2
        B2 = S1
        S2 = B1_m

        B2_d = B2//S2
        B2_m = B2%S2

        B2_result = B0_mn1+ (B2_d*(-1))*B1_result
        #layer3
        B3 = S2
        S3 = B2_m

        B3_d = B3//S3
        #B3_m = B3%S3

        B3_result = B1_result + (B3_d*(-1))*B2_result
        if(B0_m==1):
            return convert(B0, B0_mn1) #B0_mn1
        else:
            if(B1_m==1):
                return convert(B0, B1_result) #B1_result
            else:
                if(B2_m==1):
                    return convert(B0, B2_result) #B2_result
                else:
                    return convert(B0, B3_result) #B3_result
                
def convert(B0, temp):
    if(temp<0):
        return B0 + temp
    else:
        return temp