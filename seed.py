from datetime import datetime
import faker
from random import randint, choice
import sqlite3

NUMBER_STUDENTS = 50
NUMBER_PROFESSORS = 5
NUMBER_GRADES = 20


def generate_fake_data(number_students, number_professors):
    fake_students = []
    fake_professors = []

    fake_data = faker.Faker()

    for _ in range(number_students):
        fake_students.append(fake_data.name())

    for _ in range(number_professors):
        fake_professors.append(f"Professor {fake_data.name()}")

    fake_groups = ['Group A', 'Group B', 'Group C']
    fake_subjects = ["Math", "Physics", "History", "Biology", "English"]

    return fake_students, fake_groups, fake_subjects, fake_professors

def prepare_data(students, groups, subjects, professors) -> tuple:
    for_groups = []

    for group in groups:
        for_groups.append((group, ))

    for_professors = []
    for professor in professors:
        for_professors.append((professor, ))

    for_students = []
    for student in students:
        for_students.append((student, randint(1, len(groups))))

    for_subjects = []
    for subject in subjects:
        for_subjects.append((subject, randint(1, len(professors))))

    for_grades = []
    for student_id in range(1, len(students) + 1):
        for _ in range(NUMBER_GRADES):
            subject_id = randint(1, len(subjects))
            grade = randint(1, 100)
            date = datetime(2025, randint(1, 12), randint(1, 28)).date().isoformat()
            for_grades.append((grade, date, student_id, subject_id))


    return for_groups, for_professors, for_students, for_subjects, for_grades

def insert_data_to_db(groups, professors, students, subjects, grades):

    with sqlite3.connect('schema.db') as conn:
        cur = conn.cursor()

        sql_to_grades = """ 
                INSERT INTO grades(grade_number, date_recv, student_id, subject_id)
                VALUES (?, ?, ?, ?)
                """
        cur.executemany(sql_to_grades, grades)

        sql_to_subjects = """ 
               INSERT INTO subjects(subject_name, professor_id)
               VALUES (?, ?)
               """
        cur.executemany(sql_to_subjects, subjects)

        sql_to_students = """ 
                INSERT INTO students(student_name, group_id)
                VALUES (?, ?) 
                """
        cur.executemany(sql_to_students, students)

        sql_to_professors = """ 
        INSERT INTO professors(professor_name)
        VALUES (?)
        """
        cur.executemany(sql_to_professors, professors)

        sql_to_groups = """ 
              INSERT INTO groups(group_name) 
              VALUES (?)
              """
        cur.executemany(sql_to_groups, groups)

        conn.commit()


if __name__ == '__main__':
    students, groups, subjects, professors = generate_fake_data(NUMBER_STUDENTS, NUMBER_PROFESSORS)

    groups_data, professors_data, students_data, subjects_data, grades_data = prepare_data(students, groups, subjects, professors)

    insert_data_to_db(groups_data, professors_data, students_data, subjects_data, grades_data)