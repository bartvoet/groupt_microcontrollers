## Databases met Python

We hebben nu een eerste basis-introductie gehad in 

* Principe van een **database** en SQL
* **Toegepast** op een SQL-datbase, in dit geval de embedded database **Sqlite**
* Het **aanmaken** van zo'n **database** en **creatie** van **tabellen**
* Het **ondervragen** en **aanvullen** van data via **CRUD-statements**

### Voorbereiding 1: Hernemen van studenten-applicatie

Als voorbeeld We hernemen we de applicatie die we eerder in de cursus hebben gemaakt rond studenten.  

~~~python
class Student:
    def __init__(self,name,lab=0,theory=0):
        self.name = name
        self.lab_points = lab
        self.theory_points = 0

    def points(self):
        return (self.lab_points + self.theory_points)/2

    def succeeded(self):
        return points(self) >= 10    
        
    def __str__(self):
        return "Student {} has {} for lab and {} for theory, so average of {}".format(
            self.name, self.lab_points,self.theory_points,self.points())

students = []

students.append(Student("Jan Janssens",15,17))
students.append(Student("Piet Pieters",15,17))

for student in students:
    print(student)
~~~

Deze applicatie laat ons toe studenten-gegevens in een lijst op te slagen en deze te hergebruiken.

~~~
Student Jan Janssens has 15 for lab and 0 for theory, so average of 7.5
Student Piet Pieters has 15 for lab and 0 for theory, so average of 7.5
~~~

### Voorbereiding 2: Interactiviteit toevoegen

We breiden deze ook uit door er wat interactiviteit aan toe te voegen door middel van een éénvoudig menu...

~~~python
class Student:
    def __init__(self,name,lab=0,theory=0):
        self.name = name
        self.lab_points = lab
        self.theory_points = theory

    def points(self):
        return (self.lab_points + self.theory_points) // 2

    def succeeded(self):
        return points(self) >= 10    
        
    def __str__(self):
        return "Student {} has {} for lab and {} for theory, so average of {}".format(
            self.name, self.lab_points,self.theory_points,self.points())

students = []

def input_number(request):
    number_input = input(request)
    return int(number_input)   

menu = """
1. Voeg student toe
2. Toon studenten
3. Stop applicatie
"""
while True:

    menu_input = input(menu)
    
    if menu_input == "1":
        student_name = input("Naam student(e): ")
        lab_points = input_number("Labo-punten: ")
        theory_points = input_number("Theorie-punten: ")
        students.append(Student(student_name,lab=lab_points,theory=theory_points))
    elif menu_input == "2":
        for student in students:
            print(student)
    elif menu_input == "3":
        print("")
        quit()
    else:
        print("ongekende input")
~~~

Hiermee kan je deze dan vanuit een éénvoudige command-line-interface bewerken

~~~
python3 students.py 

1. Voeg student toe
2. Toon studenten
3. Stop applicatie
1
Naam student(e): Jan Jannssens
Labo-punten: 15
Theorie-punten: 12

1. Voeg student toe
2. Toon studenten
3. Stop applicatie
1
Naam student(e): Bart Voet
Labo-punten: 15
Theorie-punten: 16

1. Voeg student toe
2. Toon studenten
3. Stop applicatie
2
Student Jan Jannssens has 15 for lab and 12 for theory, so average of 13
Student Bart Voet has 15 for lab and 16 for theory, so average of 15

1. Voeg student toe
2. Toon studenten
3. Stop applicatie
~~~

Groot nadeel is natuurlijk dat - éénmaal deze afgesloten - je niet meer aan de data kan geraken.  
Hiervoor gaan we deze code omvormen om de data in een database bij te houden.

### sqlite in python - basis

De sql-commando's die we eerder hebben gezien, kan je vanuit een api doorsturen naar een database

~~~
+---------------+---+---------+----------------+
|               |   |         |                |
|               |   +-------->|                |
|               | A |   SQL   |                |
|  Applicatie   | P |         |  Database      |
|               | I |   DATA  |                |
|               |   |<--------+                |
|               |   |         |                |
+---------------+---+---------+----------------+
~~~

Gedetailleerde documentatie rond het gebruik hiervan vind je te https://docs.python.org/3/library/sqlite3.html maar we proberen de basis-principes te hernemen:


#### Connectie maken met een database

De eerste stap die je dient te doen is een connectie-object aan te maken.  
Dit doe je met de volgende code:

~~~python
import sqlite3
con = sqlite3.connect('student.db')
# ...code to interrogate the database
con.close()
~~~
Dit gaat aan een database connecteren die zich in dezelfde folder bevindt als vanwaar je code uitvoert.  
Als deze nog niet bestaat zal de library een lege database aanmaken.

Wel belangrijk is het om de database vrij te geven voor gebruik via de close()-functie!!!!

#### Uitvoeren van een query

Voortgaande op bovenstaande code kan je een cursor-object aanmaken.  
Dit object kan je dan gebruiken om queries uit te voeren via de functie execute() 

~~~python
cur = con.cursor()
query_result = cur.execute('SELECT student_id, name, lab, theory FROM student')
~~~

Het resultaat van dit - een resultset - kan je vervolgens itereren als een lijst 

~~~python
for row in query_result:
    print(Student(row[1],"met id",row[0]))

con.close()
~~~

#### Gebruik van parameter-substution

Eerder hadden we gezien dat we binnen een where-clausule condities konnen bepalen om een filtering/selectie toe te passen.  
Hiervoor voorziet de api de mogelijkheid van substutie, stel dat je enkel studenten wil query-en die meer dan 10 punten hebben kan je dit als volgt doen.

~~~python
query_result = cur.execute('SELECT student_id, name, lab, theory FROM student where lab > ?', 10)

for row in query_result:
    print(Student(row[1],"met id",row[0]))

con.close()
~~~

De conventie is dat je op de plek waar je een parameter wil toevoegen een vraagteken plaatst, en de parameter als opeenvolgende paramzeter opgeeft van de execute-functie.  
Niets weerhoud je ervan van meerdere parameters toe te voegen/combineren

~~~python
query_result = cur.execute('SELECT student_id, name, lab, theory FROM student where lab > ? and theory > ?', 10,12)

for row in query_result:
    print(Student(row[1],"met id",row[0]))

con.close()
~~~

### Toegepast op studenten-appilcatie

Onderstaande code is een toepassing van bovenstaande.  
We gaan hieronder de wijzigingen overlopen.

~~~python
import sqlite3 as sl

class Student:
    def __init__(self,name,lab=0,theory=0,id=0):
        self.name = name
        self.lab_points = lab
        self.theory_points = theory

    def points(self):
        return (self.lab_points + self.theory_points) // 2

    def succeeded(self):
        return points(self) >= 10    
        
    def __str__(self):
        return "Student {} has {} for lab and {} for theory, so average of {}".format(
            self.name, self.lab_points,self.theory_points,self.points())

STUDENT_DB_FILE_NAME = "students.db"

def init_database():
    con = sl.connect(STUDENT_DB_FILE_NAME)
    with con:
        con.execute("""
            CREATE TABLE IF NOT EXISTS student (
                student_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                lab INTEGER,
                theory INTEGER
            );
        """)

def get_students():
    con = sl.connect(STUDENT_DB_FILE_NAME)
    cur = con.cursor()
    query_result = cur.execute('SELECT student_id, name, lab, theory FROM student')
    students = []
    for row in query_result:
        students.append(Student(row[1],row[2],row[3],row[0]))
    con.close()
    return students

def save_new_student(student):
    con = sl.connect(STUDENT_DB_FILE_NAME)
    cur = con.cursor()
    cur.execute('insert into student(name, lab, theory) values(?,?,?)', [student.name,student.lab_points,student.theory_points])
    con.commit()
    con.close()

def input_number(request):
    number_input = input(request)
    return int(number_input)   

menu = """
1. Voeg student toe
2. Toon studenten
3. Stop applicatie
"""

init_database()

while True:
    menu_input = input(menu)

    if menu_input == "1":
        student_name = input("Naam student(e): ")
        lab_points = input_number("Labo-punten: ")
        theory_points = input_number("Theorie-punten: ")
        save_new_student(Student(student_name,lab=lab_points,theory=theory_points))
    elif menu_input == "2":
        for student in get_students():
            print(student)
    elif menu_input == "3":
        print("")
        quit()
    else:
        print("ongekende input")
~~~

#### Toevoegen van de sqlite-library

~~~python
import sqlite3 as sl
~~~


#### Inialiseren van de database

We maken de database aan bij opstarten van de applicatie.  
Het keyword "if not exists" zorgt ervoor dat de create niet opnieuw wordt aangemaakt als deze reeds bestaat.

~~~python
STUDENT_DB_FILE_NAME = "students.db"

def init_database():
    con = sl.connect(STUDENT_DB_FILE_NAME)
    with con:
        con.execute("""
            CREATE TABLE IF NOT EXISTS student (
                student_id INTEGER PRIMARY KEY,
                name TEXT,
                lab INTEGER,
                theory INTEGER
            );
        """)
~~~

We voegen deze initialisatie toe bij het opstarten van de applicatie

~~~python
menu = """
1. Voeg student toe
2. Toon studenten
3. Stop applicatie
"""

init_database()

while True:
~~~

#### Ophalen van studenten-data

We maken een fucntie die het resultaat van een query gaat omzetten naar een object

~~~python
def get_students():
    con = sl.connect(STUDENT_DB_FILE_NAME)
    query_result = con.execute('SELECT student_id, name, lab, theory FROM student')
    students = []
    for row in query_result:
        students.append(Student(row[1],row[2],row[3],row[0]))
    con.close()
    return students
~~~

En roepen dit aan bij optie 2

~~~python
    elif menu_input == "2":
        for student in get_students():
            print(student)
~~~

#### Aanmaken van een student

Een nieuwe student aanmaken doe we via een functie **save_new_student** (met als argument een Student-object)

Deze functie neemt als **argument** een object (van de klasse student) schrijft deze naar de database weg

~~~python
def save_new_student(student):
    con = sl.connect(STUDENT_DB_FILE_NAME)
    cur = con.cursor()
    cur.execute('insert into student(name, lab, theory) values(?,?,?)', [student.name,student.lab_points,student.theory_points])
    con.commit()
    con.close()
~~~

Deze wordt dan **aangeroepen** vanuit **optie 1**:

~~~python
    if menu_input == "1":
        student_name = input("Naam student(e): ")
        lab_points = input_number("Labo-punten: ")
        theory_points = input_number("Theorie-punten: ")
        save_new_student(Student(student_name,lab=lab_points,theory=theory_points))
~~~

