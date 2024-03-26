def count_substring(string, sub_string):
    count = 0
    start = 0
    while True:
        start = string.find(sub_string, start)  # Find the next occurrence of the sub_string
        if start == -1:  # If no further occurrences are found, break the loop
            break
        count += 1
        start += 1  # Move the starting index for the next search
    return count


if __name__ == '__main__':
    string = input().strip()
    sub_string = input().strip()
    
    count = count_substring(string, sub_string)
    print(count)