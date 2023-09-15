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
    #layer0
    B0_d = B0//S0
    B0_m = B0%S0
    B0_result = B0_d # * -1
    #layer1
    B1 = S0
    S1 = B0_m
    if(S1==0):
        S1=1
    B1_d = B1//S1
    B1_m = B1%S1
    B1_result =  1 + B0_d * B1_d    #1-B1_d*B0_result
                #(B0//S0)*(S0//(B0%S0))+1
    #layer2
    B2 = S1
    S2 = B1_m
    if(S2==0):
        S2=1
    B2_d = B2//S2
    B2_m = B2%S2

    B2_result = B0_result + B2_d*B1_result #B0_d*(-1-B2_d*B1_d)-B2_d   #B0_mn1+ (B2_d*(-1))*B1_result
                #  B0_d*(-1) + B2_d*(-1)*((B0_d)*(B0_m))+1)
                #B0_d*(-1) + (B2_d*(-1)*(B0_d*B1_d+1))
                #B0_d*(-1-B2_d*B1_d)-B2_d
                
    #layer3
    B3 = S2
    S3 = B2_m
    if(S3==0):
        S3=1
    B3_d = B3//S3
    B3_m = B3%S3
    B3_result = B1_result + (B3_d)*B2_result
                #B0_d * B1_d +1 +(B3_d*(-1))*    (B0_d*(-1-B2_d*B1_d)-B2_d)
                #B0_d*(1-B3_d*(-1-B2_d*B1_d))+B2_d*B3_d+1
    #layer4
    B4 = S3
    S4 = B3_m
    if(S4==0):
        S4 = 1
    B4_d = B4//S4
    B4_m = B4%S4    
    B4_result = B2_result + (B4_d)*B3_result

    """
    #layer5
    B5 = S4
    S5 = B4_m
    if(S5==0):
        S5 = 0.1
    B5_d = B5//S5
    B5_m = B5%S5
    B5_result = B3_result - (B5_d)*B4_result
    
    #layer6
    B6 = S5
    S6 = B5_m
    if(S6==0):
        S6 = 0.1
    B6_d = B6//S6
    B6_m = B6%S6
    B6_result = B4_result - (B6_d)*B5_result
    
    #layer7
    B7 = S6
    S7 = B6_m
    if(S7==0):
        S7 = 0.1
    B7_d = B7//S7

    B7_result = B5_result - (B7_d)*B6_result
                #B5_result + (B7_d*(-1))*(B4_result + (B6_d*(-1))*B5_result)
    """
    B_d_list = [B0_d,B1_d,B2_d,B3_d,B4_d]
    B_m_list = [B0_m,B1_m,B2_m,B3_m,B4_m]

    if(B0_m==1):
        return B0-B0_result, B_d_list, B_m_list,B0_result,0 #B0_mn1
    else:
        if(B1_m==1):
            #print("B1_result: {}, {}: {}".format(B1_result, B0,((B1_result)%B0)))
            #return convert(B0, B1_result), B_d_list, B_m_list,B1_result,1 #B1_result
            return B1_result, B_d_list, B_m_list,B1_result,1 #B1_result
        else:
            if(B2_m==1):
                print("B2_result: {}, {}: {}".format(B2_result, B0,((-1*B2_result)%B0)))
                return B0-B2_result, B_d_list, B_m_list,B2_result,2 #B2_result
            else:
                if(B3_m==1):
                    return B3_result, B_d_list, B_m_list,B3_result,3 #B3_result
                else:
                    if(B4_m==1):
                        return B0-B4_result, B_d_list, B_m_list,B4_result,4
                    
                    """
                    else:
                        if(B5_m==1):
                            return convert(B0,B5_result)
                        
                        else:
                            if(B6_m==1):
                                return convert(B0,B6_result)
                            else:
                                pass
                                #return convert(B0,B7_result)
                    """
def convert(B0, temp):

    #return (B0+temp)%B0
    if(temp<=0):
        return (B0 + temp)
    else:
       return temp
    


B_dmax = [-100,-100,-100,-100,-100]
B_dmin = [99,99,99,99,99]

B_mmax = [-100,-100,-100,-100,-100]
B_mmin = [99,99,99,99,99]

B_result_max = [-100,-100,-100,-100,-100]
B_result_min = [99,99,99,99,99]


for prime in prime_table_5:
    for i in range(2,prime):
        
        a,b = 0,0
        if(i<prime):
            a, b = i, prime
        else:
            a, b = prime, i
        #print("test i: {}".format(i))
        #print("test prime: {}".format(prime))
        c, d_list, m_list,b_temp,index =four_bit(prime,i)
        
        comp = (a*c)%b
        #print("inv: {}".format(four_bit(prime,i)))
        
        for j in range(5):
            if d_list[j]>B_dmax[j]:
                B_dmax[j] = d_list[j]
            if d_list[j]<B_dmin[j]:
                B_dmin[j]=d_list[j]

            if m_list[j]>B_mmax[j]:
                B_mmax[j] = m_list[j]
            if m_list[j]<B_mmin[j]:
                B_mmin[j ]= m_list[j]

        if b_temp>B_result_max[index]:
            B_result_max[index] = b_temp
        if b_temp<B_result_min[index]:
            B_result_min[index] = b_temp

        if(c<0):
            print("fail at neg: {}, {}".format(i,prime))
            print("fail!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        if(c>=prime):
            print("fail at larger: {}, {}".format(i,prime))
            print("fail!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")

        if(comp!=1):
            print("fail at: {}, {}".format(i,prime))
            print(c)
            print("fail!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")

print("B_d range:")
for k in range(5):
    print("layer {}: {} ~ {}".format(k, B_dmin[k], B_dmax[k]))

print("B_m range:")
for k in range(5):
    print("layer {}: {} ~ {}".format(k, B_mmin[k], B_mmax[k]))

print("B_result range:")
for k in range(5):
    print("layer {}: {} ~ {}".format(k, B_result_min[k], B_result_max[k]))



