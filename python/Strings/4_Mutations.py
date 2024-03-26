def mutate_string(string, position, character):
    character_list = list(string)
    character_list[position] = character
    new_string = ''.join(character_list)
    return new_string


if __name__ == '__main__':
    s = input()
    i, c = input().split()
    s_new = mutate_string(s, int(i), c)
    print(s_new)