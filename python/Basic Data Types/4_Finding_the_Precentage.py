if __name__ == '__main__':
    n = int(input())
    student_marks = {}
    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name] = scores
    query_name = input()

    # Calculate average marks for the queried student
    if query_name in student_marks:
        marks = student_marks[query_name]
        average = sum(marks) / len(marks)
        print("{:.2f}".format(average))
    else:
        print("Student not found")