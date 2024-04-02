import itertools

S = input().split()
STRING, NUMBER = sorted(S[0]), int(S[1])

print(*list(map(''.join, itertools.permutations(STRING, NUMBER))), sep='\n')