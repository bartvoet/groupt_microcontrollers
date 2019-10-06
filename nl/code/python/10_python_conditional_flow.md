## Conditionele uitvoering

### Van sequentiele naar conditionele uitvoering


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
                |                Sequentiele uitvoering                |
                |                                                      |
                |   +------------+   +------------+   +------------+   |
                |   | Statements |   | Variabelen |   | Expressies |   |
                +---+------------+---+------------+---+------------+---+
~~~

We hebben nu kennis gemaakt met een aantal basis-elementen uit de sequentiele uitvoering:

* **Statements**: assignment, function-call, ...
* **Variabelen**: int, string
* Rekenkundig **Expressies**

We starten nu aan meer **complexere code**, namelijk we gaan nu naar **conditionele uitvoering** kijken.  
Dit principe bouwt zich **bovenop sequentiele uitvoering** gebouwd maar voegt het element van **keuze** toe.

Door een combinatie van **relationele expressies** en de **if-else-statements** kunnen we kiezen - at runtime - welke
blok van code er wordt uitgevoerd (waar we deze keuse niet hadden bij zuiver sequentiele uitvoering).  
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


#### Relationele expressies

Het eerste element zijn de **relationele expressies**.  
Dit zijn expressies die een **vergelijk** maken **tussen** 2 variabelen (in meeste gevallen numerieke variabelen)

* X **==** Y: is gelijk aan
* X **<** Y: kleiner dan
* X **>** Y: groter dan 
* X **<=** Y: kleiner of gelijk aan
* X **>=** Y: groter of gelijk aan

~~~python
a = 5
b = 6
c = a < b 
print(c)   # prints False
d = a > b  
print(d)   # prints True
print(type(c)) # prints <class 'bool'>
print(type(d)) # prints <class 'bool'>
~~~

### Variabelen van het type boolean

Het resultaat van een relationele expressie (ofwel **True** en **False**) is niet van een numeriek t ype zoals bij rekenkundige expressies maar een boolean.  
Dit type van variabele kan je gebruiken in condtionele en repetitieve statements


### if-else-statement

Deze boolean-variabele of expressie kan je dan gebruiken in een if-statement.  
Stel je wil een programma schrijven dat 2 getallen gaat vergelijken (groter/kleiner) kunnen we al gebruik maken van wat we daarnet hebben geleerd.

~~~python
a = int(input("Geef getal a in: "))
b = int(input("Geef getal b in: "))

print(a > b)
~~~

Afhankelijk van wat je intypt zal dit 


~~~python
a = int(input("Geef getal a in: "))
b = int(input("Geef getal b in: "))

if a > b:
    print("Getal a is groter dan getal b")

~~~


~~~python
a = int(input("Geef getal a in: "))
b = int(input("Geef getal b in: "))

if a > b:
    print("Getal a is groter dan getal b")
else:
    print("Getal a is kleiner of gelijk aan b")

~~~

~~~python
a = int(input("Geef getal a in: "))
b = int(input("Geef getal b in: "))

if a > b:
    print("Getal a is groter dan getal b")
elif a < b:
    print("Getal a is kleiner")
else:
    print("Getal a is gelijk aan b")
~~~

~~~python
if expression:
   statement(s)
else:
   statement(s)
~~~

 (condities en herhalingen).  
Condities zijn vergelijkbaar met wat je uit C kent, dezelfde 3 constructies vind je terug:

* if-clausules
* else-clausule
* 1 of meerdere elif-clausules

~~~python
if expression:
   statement(s)
elif:
   statements(s)
...elif:...
else:
   statement(s)
~~~



Let wel op de **verschillende notatie** voor de **logische operatoren**

* X or Y
* X and Y
* not X



###




