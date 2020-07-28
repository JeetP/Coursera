import random
import time
import timeit
'''while(True):
    a = random.randint(2,10);
    print("7 * " + str(a) + " = ")
    time.sleep(1.5)
    print(7*a)
    time.sleep(1)'''
while(True):
    #a = random.randint(1,99)
    b = random.randint(1,9)
    a = 8
    print(str(a) + " * " + str(b))
    start = time.time()
    while(True):
        time.sleep(1)
        ans = input();
        if(ans == a*b):
            print("Correct")
            break;
        end = time.time()
        if(end - start == 2):
            break;

    #print(a+b)
    #time.sleep(2)
'''while(True):
    a = random.randint(0,9)
    b = random.randint(0,9)
    print(str(a) + " + " + str(b))
    time.sleep(0.5)
    print(a+b)
    time.sleep(1)'''