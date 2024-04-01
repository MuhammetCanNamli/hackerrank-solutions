_ = input()
SET_A = {int(i) for i in input().split(' ')}
_ = input()SET_B = {int(i) for i in input().split(' ')}

print(len(SET_A.intersection(SET_B)))