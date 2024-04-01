_ = int(input())
SET_A = set(map(int, input().split()))

_ = int(input())
SET_B = set(map(int, input().split()))

print(len(SET_A.symmetric_difference(SET_B)))