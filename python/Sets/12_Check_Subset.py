for i in range(int(input())):
    a = int(input())
    SET_A = set(map(int, input().split()))

    b = int(input())
    SET_B = set(map(int, input().split()))

    if len(SET_A - SET_B) == 0:
        print("True")
    else:
        print("False")