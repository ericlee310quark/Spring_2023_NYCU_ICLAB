prime_table_4 = [5,7,11,13]
prime_table_5 = [5,7,11,13,19,23,29,31]
prime_table_6 = [5,7,11,13,19,23,29,31,37,41,43,\
               47,53,59,61]





prime_table_7 = [5,7,11,13,19,23,29,31,37,41,43,\
               47,53,59,61,67,71,73,79,83,89,\
                97,101,103,107,109,113,127]



def four_bit(in1, in2):
    if(in1>in2):
        B0, S0 = in1, in2
    else:
        B0, S0 = in2, in1
    B0_d = B0//S0
    B0_m = B0%S0
    B0_mn1 = B0_d
    #layer1
    B1 = S0
    S1 = B0_m
    if(S1==0):
        S1=0.1
    B1_d = B1//S1
    B1_m = B1%S1
    B1_result = B0_d * B1_d +1
    #layer2
    B2 = S1
    S2 = B1_m
    if(S2==0):
        S2=0.1
    B2_d = B2//S2
    B2_m = B2%S2

    B2_result = B0_mn1*(-1)+ (B2_d)*B1_result
    #layer3
    B3 = S2
    S3 = B2_m
    if(S3==0):
        S3=0.1
    B3_d = B3//S3
    B3_m = B3%S3
    B3_result = B1_result*(-1) + (B3_d)*B2_result
    
    #layer4
    B4 = S3
    S4 = B3_m
    if(S4==0):
        S4 = 0.1
    B4_d = B4//S4
    B4_m = B4%S4    
    B4_result = B2_result*(-1) + (B4_d)*B3_result
    #layer5
    B5 = S4
    S5 = B4_m
    if(S5==0):
        S5 = 0.1
    B5_d = B5//S5
    B5_m = B5%S5
    B5_result = B3_result*(-1) + (B5_d)*B4_result
    #layer6
    B6 = S5
    S6 = B5_m
    if(S6==0):
        S6 = 0.1
    B6_d = B6//S6
    B6_m = B6%S6
    B6_result = B4_result*(-1) + (B6_d)*B5_result
    #layer7
    B7 = S6
    S7 = B6_m
    if(S7==0):
        S7 = 0.1
    B7_d = B7//S7

    B7_result = B5_result*(-1) + (B7_d)*B6_result


    if(B0_m==1):
        return B0-B0_mn1#convert(B0, B0_mn1) #B0_mn1
    else:
        if(B1_m==1):
            return convert(B0, B1_result) #B1_result
        else:
            if(B2_m==1):
                return convert(B0, B2_result) #B2_result
            else:
                if(B3_m==1):
                    return convert(B0, B3_result) #B3_result
                else:
                    if(B4_m==1):
                        return convert(B0,B4_result)
                    else:
                        if(B5_m==1):
                            return convert(B0,B5_result)
                        else:
                            if(B6_m==1):
                                return convert(B0,B6_result)
                            else:
                                return convert(B0,B7_result)

def convert(B0, temp):
    print("temp: {}".format(temp%B0))
    #return temp
    if(temp<0):
        return (B0 + temp)%B0
    else:
        return temp%B0
    
in1 = 8
in2 = 13
print("inv: {}".format(four_bit(in1,in2)))
a,b = 0,0
if(in1<in2):
    a,b = in1, in2
else:
    a,b = in2, in1
comp = (a*four_bit(in1,in2))%b
print(comp)


for prime in prime_table_4:
    for i in range(2,prime):
        
        a,b = 0,0
        if(i<prime):
            a, b = i, prime
        else:
            a, b = prime, i
        #print("test i: {}".format(i))
        #print("test prime: {}".format(prime))
        comp = (a*four_bit(prime,i))%b
        #print("inv: {}".format(four_bit(prime,i)))
        if(comp!=1):
            print("fail at: {}, {}".format(i,prime))
            print("fail!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
