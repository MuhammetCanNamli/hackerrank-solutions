def print_rangoli(size):
    # Create alphabet string
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    # Create empty list to store lines
    lines = []
    # Iterate through each line of the rangoli
    for i in range(size):
        # Create the pattern for the current line
        s = '-'.join(alphabet[i:size])
        # Add the current line to the list, centered with '-' characters
        lines.append((s[::-1] + s[1:]).center(4*size - 3, '-'))
    # Print the upper half of the rangoli
    print('\n'.join(lines[::-1] + lines[1:]))
    
    
if __name__ == '__main__':
    n = int(input())
    print_rangoli(n)