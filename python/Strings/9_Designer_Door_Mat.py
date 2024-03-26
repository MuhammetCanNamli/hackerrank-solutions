def print_door_mat(N, M):
    # Upper Part
    for i in range(N//2):
        pattern = '.|.' * (2*i + 1)
        print(pattern.center(M, '-'))

    # Welcome Message
    print('WELCOME'.center(M, '-'))

    # Lower Part
    for i in reversed(range(N//2)):
        pattern = '.|.' * (2*i + 1)
        print(pattern.center(M, '-'))

if __name__ == "__main__":
    N, M = map(int, input().split())
    print_door_mat(N, M)