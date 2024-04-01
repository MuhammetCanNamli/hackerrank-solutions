N = input()
ROOM_LIST = input().split()
ROOM_SET = set(ROOM_LIST)

for elements in list(ROOM_SET):
    ROOM_LIST.remove(elements)

CAPTAIN_ROOM_NUM = ROOM_SET.difference(set(ROOM_LIST)).pop()
print(CAPTAIN_ROOM_NUM)