m = int(input())

a = set(map(int, input().split()))

n = int(input())

b = set(map(int, input().split()))

# Difference in each sets
dif_a_to_b = a.difference(b)
dif_b_to_a = b.difference(a)

# Union of difference
union_dif = dif_a_to_b.union(dif_b_to_a)

# Converting set to a list
RESULT = list(union_dif)

# Sorting
RESULT.sort()

# Iteration
for i in range(len(RESULT)):
    print(RESULT[i])