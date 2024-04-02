from itertools import combinations

S, N = input().split()

for i in range(1, int(N)+1):
    for j in combinations(sorted(S), i):
        print(''.join(j))