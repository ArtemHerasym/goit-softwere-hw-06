# SQL Homework - Students Database

This project creates and fills a SQLite database for a student grading system.

The database includes:

* students
* groups
* professors
* subjects
* grades

The project also contains SQL queries for analyzing students, grades, subjects, groups, and professors.

## Project Structure

```text
module_s6_homework/
│
├── create_db.py
├── seed.py
├── schema.sql
├── schema.db
├── pyproject.toml
├── poetry.lock
├── README.md
│
└── queries/
    ├── query_1.sql
    ├── query_2.sql
    ├── query_3.sql
    ├── query_4.sql
    ├── query_5.sql
    ├── query_6.sql
    ├── query_7.sql
    ├── query_8.sql
    ├── query_9.sql
    ├── query_10.sql
    ├── query_11.sql
    └── query_12.sql
```

## Database Description

The database has the following relationships:

* One group can have many students.
* One professor can teach many subjects.
* One student can have many grades.
* One subject can have many grades.
* The `grades` table connects students and subjects.

Main relationships:

```text
groups.id        -> students.group_id
professors.id    -> subjects.professor_id
students.id      -> grades.student_id
subjects.id      -> grades.subject_id
```

## How to Run

### 1. Install dependencies

If you use Poetry:

```bash
poetry install
```

If you use pip:

```bash
pip install faker
```

### 2. Create the database

```bash
poetry run python create_db.py
```

or:

```bash
python create_db.py
```

This runs `schema.sql` and creates the database tables.

### 3. Fill the database with fake data

```bash
poetry run python seed.py
```

or:

```bash
python seed.py
```

This fills the database with:

* 3 groups
* 5 professors
* 5 subjects
* 50 students
* 1000 grades

### 4. Run SQL queries

Open `schema.db` in DBeaver or another SQLite database tool.

Then run the SQL files from the `queries/` folder.

## Queries

The project includes required queries:

1. Find 5 students with the highest average grade across all subjects.
2. Find the student with the highest average grade in a specific subject.
3. Find the average grade in groups for a specific subject.
4. Find the average grade across the whole grades table.
5. Find courses taught by a specific professor.
6. Find students in a specific group.
7. Find grades of students in a specific group for a specific subject.
8. Find the average grade given by a specific professor.
9. Find courses attended by a specific student.
10. Find courses taught to a specific student by a specific professor.

The project also includes optional advanced queries:

11. Find the average grade that a specific professor gives to a specific student.
12. Find grades of students in a specific group for a specific subject on the latest lesson date.

## Notes

The database is generated with SQLite.

The `seed.py` file uses Faker to generate random student and professor names.
