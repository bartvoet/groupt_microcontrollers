## Python modules

~~~python
def hello():
    print("hello")

def world():
    print("world")
~~~

~~~python
>>> import hello
>>> hello.hello()
hello
>>> hello.world()
world
>>> hello.__name__
'hello'
~~~

~~~python
import hello
hello.hello()
hello.world()
~~~

~~~
$ python hello_test.py
hello
world
~~~


~~~python
def hello():
    print("hello")

def world():
    print("world")

hello()
world()
~~~

~~~python
Python 3.8.5 (default, Jan 27 2021, 15:41:15) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import hello
hello
world
>>> 
~~~


~~~
$ python hello.py
hello
world
$ python hello_test.py
hello
world
hello
world
~~~

~~~python
Python 3.8.5 (default, Jan 27 2021, 15:41:15) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import hello
hello
world
>>> 
~~~


#### Verbetering

~~~python
def hello():
    print("hello")

def world():
    print("world")

if __name__ == "__main__":
    hello()
    world()
~~~

~~~python
Python 3.8.5 (default, Jan 27 2021, 15:41:15) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import hello
>>> 
~~~

### 

~~~python
import hello
hello.world()
hello.hello()
~~~


~~~
$ python hello.py
hello
world
$ python hello_test.py
world
hello
~~~

###


~~~python
from hello import world
world()
~~~

~~~
Python 3.8.5 (default, Jan 27 2021, 15:41:15) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from hello import world
hello
world
>>> world()
world
>>> hello()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'hello' is not defined
~~~

~~~python
from hello import *
world()
hello()
~~~

~~~python
>>> import sys
>>> print(sys.path)
['', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/home/bart/.local/lib/python3.8/site-packages', '/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages', '/usr/lib/python3.8/dist-packages']
~~~

~~~
$ ls
hello.py  __pycache__
$ ls __pycache__/
hello.cpython-38.pyc
~~~

~~~python
>>> dir(hello)
['__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', 'hello', 'world']
~~~

~~~python
>>> import builtins
>>> dir(builtins)
['ArithmeticError', 'AssertionError', 'AttributeError', 'BaseException', 'BlockingIOError', 'BrokenPipeError', 'BufferError', 'BytesWarning', 'ChildProcessError', 'ConnectionAbortedError', 'ConnectionError', 'ConnectionRefusedError', 'ConnectionResetError', 'DeprecationWarning', 'EOFError', 'Ellipsis', 'EnvironmentError', 'Exception', 'False', 'FileExistsError', 'FileNotFoundError', 'FloatingPointError', 'FutureWarning', 'GeneratorExit', 'IOError', 'ImportError', 'ImportWarning', 'IndentationError', 'IndexError', 'InterruptedError', 'IsADirectoryError', 'KeyError', 'KeyboardInterrupt', 'LookupError', 'MemoryError', 'ModuleNotFoundError', 'NameError', 'None', 'NotADirectoryError', 'NotImplemented', 'NotImplementedError', 'OSError', 'OverflowError', 'PendingDeprecationWarning', 'PermissionError', 'ProcessLookupError', 'RecursionError', 'ReferenceError', 'ResourceWarning', 'RuntimeError', 'RuntimeWarning', 'StopAsyncIteration', 'StopIteration', 'SyntaxError', 'SyntaxWarning', 'SystemError', 'SystemExit', 'TabError', 'TimeoutError', 'True', 'TypeError', 'UnboundLocalError', 'UnicodeDecodeError', 'UnicodeEncodeError', 'UnicodeError', 'UnicodeTranslateError', 'UnicodeWarning', 'UserWarning', 'ValueError', 'Warning', 'ZeroDivisionError', '_', '__build_class__', '__debug__', '__doc__', '__import__', '__loader__', '__name__', '__package__', '__spec__', 'abs', 'all', 'any', 'ascii', 'bin', 'bool', 'breakpoint', 'bytearray', 'bytes', 'callable', 'chr', 'classmethod', 'compile', 'complex', 'copyright', 'credits', 'delattr', 'dict', 'dir', 'divmod', 'enumerate', 'eval', 'exec', 'exit', 'filter', 'float', 'format', 'frozenset', 'getattr', 'globals', 'hasattr', 'hash', 'help', 'hex', 'id', 'input', 'int', 'isinstance', 'issubclass', 'iter', 'len', 'license', 'list', 'locals', 'map', 'max', 'memoryview', 'min', 'next', 'object', 'oct', 'open', 'ord', 'pow', 'print', 'property', 'quit', 'range', 'repr', 'reversed', 'round', 'set', 'setattr', 'slice', 'sorted', 'staticmethod', 'str', 'sum', 'super', 'tuple', 'type', 'vars', 'zip']
~~~

~~~python
>>> dir(bytearray)
['__add__', '__alloc__', '__class__', '__contains__', '__delattr__', '__delitem__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__iadd__', '__imul__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mod__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmod__', '__rmul__', '__setattr__', '__setitem__', '__sizeof__', '__str__', '__subclasshook__', 'append', 'capitalize', 'center', 'clear', 'copy', 'count', 'decode', 'endswith', 'expandtabs', 'extend', 'find', 'fromhex', 'hex', 'index', 'insert', 'isalnum', 'isalpha', 'isascii', 'isdigit', 'islower', 'isspace', 'istitle', 'isupper', 'join', 'ljust', 'lower', 'lstrip', 'maketrans', 'partition', 'pop', 'remove', 'replace', 'reverse', 'rfind', 'rindex', 'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines', 'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']
~~~

~~~
>>> dir(list)
['__add__', '__class__', '__contains__', '__delattr__', '__delitem__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__iadd__', '__imul__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__reversed__', '__rmul__', '__setattr__', '__setitem__', '__sizeof__', '__str__', '__subclasshook__', 'append', 'clear', 'copy', 'count', 'extend', 'index', 'insert', 'pop', 'remove', 'reverse', 'sort']
>>> a = [1,2,3]
>>> dir a
  File "<stdin>", line 1
    dir a
        ^
SyntaxError: invalid syntax
>>> dir(a)
['__add__', '__class__', '__contains__', '__delattr__', '__delitem__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__iadd__', '__imul__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__reversed__', '__rmul__', '__setattr__', '__setitem__', '__sizeof__', '__str__', '__subclasshook__', 'append', 'clear', 'copy', 'count', 'extend', 'index', 'insert', 'pop', 'remove', 'reverse', 'sort']
>>> type[a]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'type' object is not subscriptable
>>> type(a)
<class 'list'>
>>> 
~~~

### Standard posules

### Herwerken van studenten-applicatie

student_entities.py

~~~python
class Student:
    def __init__(self,name,lab=0,theory=0,id=0):
        self.name = name
        self.lab_points = lab
        self.theory_points = theory
        self.student_id=id

    def points(self):
        return (self.lab_points + self.theory_points) // 2

    def succeeded(self):
        return self.points() >= 10    
        
    def __str__(self):
        return "Student {} - {} has {} for lab and {} for theory, so average of {}".format(
            self.student_id, self.name, self.lab_points,self.theory_points,self.points())

class StudentGroup:
    def __init__(self, name, teacher, room):
        self.name = name
        self.teacher = teacher
        self.room = room

    def __str__(self):
        return "Group with name '{}' and teacher {} at room {}".format(
            self.name, self.teacher, self.room)   
~~~

student_db.py

~~~python
import sqlite3 as sl
from student_entities import *

STUDENT_DB_FILE_NAME = "students.db"

def init_database():
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        con.execute("""
            create table if not exists student_group
            (
                group_name text primary key,
                teacher text,
                room text
            );
        """)

        con.execute("""
            create table if not exists student
            (
                student_id INTEGER PRIMARY KEY,
                name TEXT,
                lab INTEGER,
                theory INTEGER,
                fk_student_group text references student_group
            );
        """)

def get_students():
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        query_result = con.execute('SELECT student_id, name, lab, theory FROM student')
        students = []
        for row in query_result:
            students.append(Student(row[1],row[2],row[3],row[0]))
    return students

def get_students_for_group(group_name):
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        query_result = con.execute('SELECT student_id, name, lab, theory FROM student where fk_student_group = ?',[group_name])
        students = []
        for row in query_result:
            students.append(Student(row[1],row[2],row[3],row[0]))
    return students

def get_groups():
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        query_result = con.execute('SELECT group_name, teacher, room FROM student_group')
        groups = []
        for row in query_result:
            groups.append(StudentGroup(row[0],row[1],row[2]))
    return groups

def save_new_student(student, group_name):
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        cur = con.cursor()
        cur.execute('insert into student(name, lab, theory,fk_student_group) values(?,?,?,?)', [student.name,student.lab_points,student.theory_points,group_name])
        con.commit()

def save_new_group(group_name, lector, room):
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        cur = con.cursor()
        cur.execute("insert into student_group(group_name, teacher, room) values(?,?,?)", [group_name, lector, room])
        con.commit()

def get_student(id):
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        query_result = con.execute('select student_id, name, lab, theory FROM student where student_id = ?',str(id))
        row = query_result.fetchone()
    return Student(row[1],row[2],row[3],row[0])

def update_points(id,lab,theory):
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        update_tatement = 'update student SET lab = ? , theory = ? WHERE student_id = ?'
        con.execute(update_tatement, [lab,theory,id])
        con.commit()

def delete_student(id):
    with sl.connect(STUDENT_DB_FILE_NAME) as con:
        con.execute("delete from student where student_id = ?", [id])
        con.commit()

init_database()
~~~

student_cmd.py

~~~python
from students import *
from students_db import *

def input_number(request):
    number_input = input(request)
    return int(number_input)   

menu = """
a. Maak studenten-groep aan
b. Toon groepen
1. Voeg student toe
2. Toon studenten
3. Toon student
4. Update van punten student
5. Verwijderen van een student
6. Stop applicatie
"""

sub_menu_students = """
a. Alle studenten
b. Studenten voor groep
"""

while True:
    menu_input = input(menu)

    if menu_input == "a":
        group_name = input("Naam groep: ")
        lector = input("Lector: ")
        room = input("Lokaal ")
        save_new_group(group_name, lector, room)
    elif menu_input == "b":
        for student_group in get_groups():
            print(student_group)    
    elif menu_input == "1":
        student_name = input("Naam student(e): ")
        lab_points = input_number("Labo-punten: ")
        theory_points = input_number("Theorie-punten: ")
        print("Kies uit volgende groepen: ")
        for student_group in get_groups():
            print(student_group.name)  
        group_name = input("> ")
        save_new_student(Student(student_name,lab=lab_points,theory=theory_points), group_name)
    elif menu_input == "2":
        choice = input(sub_menu_students)
        if choice == "a":
            students = get_students()
        else:
            print("Kies uit volgende groepen: ")
            for student_group in get_groups():
                print(student_group.name)
            group_name = input("Kies groep> ")
            students = get_students_for_group(group_name)
            
        for student in get_students():
            print(student)

    elif menu_input == "3":
        id = input_number("> ")
        student = get_student(id)
        print(student)
    elif menu_input == "4":
        print("Kies student op id")
        for student in get_students():
            print("Student met id",student.student_id,"en naam",student.name)
        id = input_number("> ")
        lab = input_number("Labo-punten:")
        theory = input_number("Theorie-punten:")
        update_points(id,lab,theory)
    elif menu_input == "5":
        print("Verwijder student op id")
        for student in get_students():
            print("Student met id",student.student_id,"en naam",student.name)
        id = input_number("> ")
        delete_student(id)
    elif menu_input == "6":
        print("De applicatie wordt afgesloten")
        quit()
    else:
        print("ongekende input")
~~~