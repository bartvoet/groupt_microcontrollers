## Conditionele uitvoering

### Van sequentiële naar conditionele uitvoering


~~~
                            +------------------------------+
                            |                              |
                            |     Hergebruik uitvoering    |
                            |                              |
                        +---+------------------------------+---+
                        |                                      |
                        |        Repetitieve uitvoering        |
                        |                                      |
           _        +---+--------------------------------------+---+
            \       |                                              |
       _____ \      |           Conditionele uitvoering            |
             /      |                                              |
           _/   +---+----------------------------------------------+---+
                |                                                      |
                |                Sequentiële uitvoering                |
                |                                                      |
                |   +------------+   +------------+   +------------+   |
                |   | Statements |   | Variabelen |   | Expressies |   |
                +---+------------+---+------------+---+------------+---+
~~~

We hebben nu kennis gemaakt met een aantal basiselementen uit de sequentiële uitvoering:

* **Statements**: assignment, function-call, ...
* **Variabelen**: int, string
* Rekenkundig **Expressies**

We starten nu aan meer **complexere code**, namelijk we gaan nu naar **conditionele uitvoering** kijken.  
Dit principe bouwt zich **bovenop sequentiële uitvoering** gebouwd maar voegt het element van **keuze** toe.

Door een combinatie van **relationele expressies** en de **if-else-statements** kunnen we kiezen - at runtime - welke
blok van code er wordt uitgevoerd (waar we deze keuze niet hadden bij zuiver sequenti�le uitvoering).  
Deze combinatie benoemen we als een **conditie**.

~~~
                                +----------------+ 
                                |      ...       |
                                +-------+--------+
                                        |
                                        V
                                       **
                                     **  **
                          True     **      **     False
                        +-------+** CONDITIE **+----------+
                        |          **      **             |
                        |            **  **               |
                        |              **                 |
        +---    +-------V--------+                +-------V--------+   ---+
        |       |   Statement    |                |   Statement    |      |
        |       +-------+--------+                +-------+--------+      |
        |               |                                 |               |
 BLOCK  |       +-------V--------+                +-------V--------+      |   BLOCK
 TRUE --+       |   Statement    |                |   Statement    |      +-- FALSE
        |       +-------+--------+                +-------+--------+      |
        |               |                                 |               |
        |       +-------V--------+                +-------V--------+      |
        |       |      ...       |                |      ...       |      |
        +---    +-------+--------+                +-------+--------+   ---+
                        |                                 |
                        +---------------+-----------------+
                                        |
                                +-------V--------+ 
                                |      ...       |
                                +-------+--------+
                                        |
                                        V
                                       ...  
~~~

Dankzij deze **conditie** kunnen we vanuit de code een keuze maken welke **block** (van statements) we uit te voeren (afhankelijk van de conditie).


### Relationele expressies

Het eerste element zijn de **relationele expressies**.  

| Operator   |   Betekenis            |
|------------|------------------------|
| ==         | gelijk aan             |
| !=         | niet gelijk aan        |
| <          | kleiner dan            |
| >          | groter dan             |
| <=         | kleiner of gelijk aan  |
| >=         | groter of gelijk aan   |

Dit zijn expressies die een **vergelijking** maken **tussen** **2 variabelen** (in meeste gevallen **numerieke variabelen**).  
Deze expressies geven aan of een vergelijking **waar** of **onwaar** is 

~~~
1 == 1  => waar
1 != 1  => niet waar
5 >  6  => niet waar
6 >= 6  => waar
...
~~~

Onderstaand Python-voorbeeld illustreert het gebruik van een relationele expressies:

~~~python
a = 5
b = 6
c = a < b 
print(c)   # prints False
d = a > b
print(d)   # prints True
~~~

Als men **a (5) vergelijkt met b (6)** voor de **relatie kleiner** dan (a < b) verkrijgt men de waarde **True**.  
Daarna vergelijken we de zelfde variabelen  voor de **relatie groter** dan en verkrijgen we de waarde **False**

### Variabelen van het type boolean

**True** en **False** zijn de **enige mogelijke** resultaten van relationele expressies.   
Hier is in Python een specifiek type voorgecreerd namelijk het type boolean.  

Als je **onderstaande code** start om het **type** te weten te komen

~~~python
print(type(c))
~~~

geeft deze het type **bool** (of **boolean**) aan

~~~
<class 'bool'>
~~~

Dit **data-type bool** heeft slechts 2 mogelijk waardes en gaan we gebruiken in **conditionele** en **repititieve statements**.


### Gebruik van booleans

We kunnen dus deze relationele expressies (of vergelijking) gebruiken om 2 getallen (variabelen, literals, resultaat expressies, ...) te gebruiken.

Stel bijvoorbeeld je wil een programma schrijven dat 2 getallen gaat vergelijken (groter/kleiner) kunnen we al gebruik maken van wat we daarnet hebben geleerd.

~~~python
a = int(input("Enter number a: "))
b = int(input("Enter number b: "))

print(a > b)
~~~

Afhankelijk van wat je intypt zal dit **True** of **False** afdrukken:

~~~
$ python compare_number.py
Enter number a: 10
Enter number b: 11
False
~~~

Het programma drukt in dit geval False af gezien 10 (a) zowiezo niet groter is dan  11 (b).  
Maar wat nu indien we iets anders willen afprinten dan False.

### Gebruik van een relationele expressie binnen een if-statement

Om meer te kunnen doen met dit resultaat (of vergelijkingà introduceren we het **if-statement**.  

Dit soort statement laat je toe van een zo'n **vergelijking** te **evalueren** en te **beslissen** of je al dan niet een **stuk code** zal **uitvoeren**.

In onderstaande code laten we deze **if-statement** beslissen om de tekst "a is bigger then b" al dan niet af te drukken.

~~~python
a = int(input("Enter number a: "))
b = int(input("Enter number b in: "))

if a > b:
    print("a is bigger then b")
~~~

Als je nu dit programma test dan zal deze afdrukken:

~~~
$ python compare_number.py
Enter number a: 11
Enter number b: 10
a is bigger then b
~~~

### Tegengestelde conditie

Probleem echter is dat als a kleiner is dan b (op basis van wat je ingeeft) er niets wordt afgedrukt

~~~
$ python compare_number.py
Enter number a: 10
Enter number b: 11
~~~

Er ontbreekt dus de **tegengestelde conditie**
Een optie zou kunnen zijn deze conditie om te keren in een 2de if-statement die daarop volgt zoals hier onder?

~~~python
a = int(input("Enter number a: "))
b = int(input("Enter number b in: "))

if a > b:
    print("a is bigger then b")
if a <= b:
    print("a is smaller or equal to b")
~~~

Dan krijg je inderdaad de correcte melding.

~~~
$ python compare_number.py
Enter number a: 10
Enter number b: 11
a is smaller or equal to b
~~~

Er is echter een meer elegante oplossing...

### if-statement is eigenlijk if-else-statement

Zo'n if-statement kan je namelijk uitbreiden met een else-clausule.  
Hieronder passen we het vorige voorbeeld aan door de 2de statement te vervangen door een else-clausule:

~~~python
a = int(input("Enter number a: "))
b = int(input("Enter number b in: "))

if a > b:
    print("a is bigger then b")
else:
    print("a is smaller or equal to b")
~~~

### else if

Een derde mogelijkheid is het toevoegen van één (of meerdere) else-if-clausule(s)  
Stel dat je ook expliciet wil afdrukken wanneer de parameters aan elkaar gelijk zijn kan je een else if-clausule toevoegen.

~~~python
a = int(input("Enter number a: "))
b = int(input("Enter number b in: "))

if a > b:
    print("a is bigger then b")
else if a == b:
    print("a is equal to b")
else:
    print("a is smaller or equal to b")
~~~

### Meerdere else-if-clausules

Je kan ook meerdere else-if-clausules aan deze statement toevoegen.  
Stel dat je bijvoorbeeld ook nog wil afdrukken als a 1 kleiner is dan b kan je nog een 2de else-if-clausule toevoegen.  

> Nota: je kan trouwens zo veel else-if-clausules toevoegen als je wil 

~~~python
a = int(input("Enter number a: "))
b = int(input("Enter number b in: "))

if a > b:
    print("a is bigger then b")
else if a == b:
    print("a is equal to b")
else if (b - a) == 1:
    print("a is -1 compared to b")
else:
    print("a is smaller or equal to b")
~~~

### Structuur

Een if-statement is samengesteld uit 2 (soorten) onderdelen of componenten

* 1 of meerdere **clausules**
    * **1 "if"-clausule**
        * **optioneel** **1 "else"**
        * **optioneel 1 of meerdere "else if"**
    * enkel **"if"** is **verplicht**
    * elke **clausule** **eindigend** op een **:**  
      (zoniet zal de interpreter een fout aan geven)
* telkens gevolgd door een **block** 
    * die (minimum) 1 of meerdere statements bevat
    * geindenteerd tov de clausule die voorafgaat
    * indentatie betekent 1 tab of 4 spaties  
      (pas op, geen spaties mixen)

> Nota: je kan kiezen tussen het gebruik van een tab of 4 spaties
> maar binnen 1 file/programma moet je consequent zijn.
> Als je beiden mixt zal de Python interpreter een error geven.


~~~python
if a > b:  # <--------------------------------- if-clausule (eindigt op :)
    print("a is bigger then b") #         |
    print("2nd time a is bigger then b")# |---- block (3 lines geindenteerd)
    print("3rd time a is bigger then b")# |
else if a == b: # <---------------------------- else-if-clausule
    print("a is equal to b")#             |
    print("2nd time a is equal to b")#    |---- block (2 lines) 
else if (b - a) == 1: #                   <---- else-if-clausule
    print("a is -1 compared to b") #      |---- block (1 line)
else: #                                   <---- else-if-clausule (2nd)
    print("a is smaller or equal to b") # |---- block (1 line)
~~~

Bovenstaande code toont aan dat je **1 of meerdere statements** in zo'n block kan steken

### Geneste if statements

if-statements zijn ook statements, dus naast enkelvoudige statements (1 lijn) kunnen dus ook andere block-statements (if, while, ...) in vervat zijn.

Stel dat we voorgaande voorbeeld herscrhijven als volgt

~~~python
a = int(input("Enter number a: "))
b = int(input("Enter number b in: "))

if a != b:
    print("a is not equal to b")
    if a > b:
        print("a is bigger than b")
    else if (b - a) == 1:
        print("a is -1 compared to b") #  
    else:
        print("b is bigger than a")
else:
    print("a is equal to b")
~~~

Binnen de eerste block/clausule (a verschillend van b) voegen we na de boodschap (a is not equal...) nod een 

