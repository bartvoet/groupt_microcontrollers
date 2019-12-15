## Objecten en klasen

Tot nog toe hebben we - lijsten buiten beschouwing genomen -  enkel gewerkt met data-types die één enkele waarde kunnen bevatten zoals oa int, float, boolean, ...

> Nota: String was een uitzondering bij deze gezien die eigenlijk een lijst is van karakters....

In dit deel bekijken we klassen in python, die het ons toelaten data te structuren in 1 data-type

### Voorbeeld: studenten-applicatie

Stel, je wil een een applicatie bouwen die de punten voor een vak wil bijhouden, zoals in de onderstaande tabel-voorstelling.

~~~
    +---------+------------+--------+-----------+
    | Naam    |  Voornaam  |  Labo  |  Theorie  |
+---+---------+------------+--------+-----------+
| 1 | Jan     |  Janssens  |  15    |   16      |
+---+---------+------------+--------+-----------+
| 2 | Piet    |  Pieters   |  15    |   16      |
+---+---------+------------+--------+-----------+
| 3 | Joris   |  Jorissen  |  15    |   16      |
+---+---------+------------+--------+-----------+
| 3 | Korneel |  Korneels  |  15    |   16      |
+---+---------+------------+--------+-----------+
~~~


### Verschillende studenten => Lijst

We weten ondertussen hoe we meerdere elementen van hetzelfde type moeten bijhouden in een Python-programma, namelijk aan de hand van een lijst.

Zo zou je elke student als een apart element in de lijst kunnen bijhouden zoals in onderstaand voorbeeld...  

~~~python
student_list = ["Jan","Piet","Joris","Korneel"]
~~~

### Groeperen van data

Probleem daarbij is dat we enkel 1 van die elementen (in dit geval de naam van de studenten) in de lijst kunnen bijhouden.  
Is er een manier om alle student-data gestructureerd bij elkaar te houden? 

### Gestructureerd programmeren met klassen

In Python kan je dit met klassen.    
Een klasse is een gestructureerd data-type dat je toelaat verschillende waardes (of subvariabelen) te groeperen onder één variabelen.  

### Klasse student

Toegepast op een student ziet zo'n data-type er als volgt uit:

~~~python
class Student:
    name = ""
    lab_points = 0
    theory_points = 0
~~~

Een klasse:

* bestaat uit een **naam** (Student in dit geval)
* voorafgegaan door het keyword **class**
* gevolgd door 1 of meerdere **attributen**  
  (name, lab_points, theory_points)


### Aanmaken van een object

Als je een variabele aanmaakt van zo'n type noemen we dit een **object**.  
Onderstaande code maakt een object aan.

~~~python
class Student:
    name = ""
    lab_points = 0
    theory_points = 0

jan = Student()
~~~

Een **object** wordt aangemaakt dooe een speciale functie (Student()), genaamd de **constructor**. 

### Constructor

Deze **constructor**:

* is een **functie**
* die **automatisch** wordt **aangemaakt**  
  (als je deze zelf niet maakt, zien direct)
* met **dezelfde naam** heeft als de **klasse**
* die je **aanroept** om een **object** (of instantie) van de klasse aan te maken

Zo direct gaan we ook zien dat deze constructor kunnen aanpassen, maar laten we eerst iets doen met het object.

### Werken met attributen

Een object bestaat uit attributen (name, lab_points, theory_points), zoals deze in de klasse werden beschreven.  
Onderstaand voorbeeld illustreert hoe je deze attributen gebruikt.

~~~python
class Student:
    name = ""
    lab_points = 0
    theory_points = 0

jan = Student()
jan.name = "Jan Janssens"
jan.lab_points = 15
jan.theory_points = 17

print(jan.lab_points)     # prints Jan Janssens
print(jan.lab_points)     # prints 15
print(jan.theory_points)  # prints 17
~~~

Je kan dez variabelen via de dot-notatie - object-naam gevolgd door punt gevolgd door naam -  uitlezen en bewerken, net zoals je dit zou doen bij een gewone variabelen.

### Meerdere objecten


~~~python
class Student:
    name = ""
    lab_points = 0
    theory_points = 0

jan = Student()
jan.name = "Jan Janssens"
jan.lab_points = 15
jan.theory_points = 17

print(jan.lab_points)
print(jan.lab_points)
print(jan.theory_points)

piet = Student()
piet.name = "Piet Pieters"
piet.lab_points = 15
piet.theory_points = 17

print(piet.lab_points)
print(piet.lab_points)
print(.theory_points) 


~~~

