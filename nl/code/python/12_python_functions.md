## Functies

Om dit deel ven de cursus - basis van programmeren - te beindigen bekijken we functies.

~~~

                    _
                     \          +------------------------------+
                ______\         |                              |             * functies
                      /         |     Hergebruik uitvoering    |             * modules (2de deel cursus)
                    _/          |                              |             * classes en objecten (2de deel cursus)
                            +---+------------------------------+---+
                            |                                      |         * while+loops
                            |        Repetitieve uitvoering        |         * loop+state
                            |                                      |         * for+loops
                        +---+--------------------------------------+---+
                        |                                              |     * if+else if+else
                        |           Conditionele uitvoering            |     * clausules
                        |                                              |     * blocks
                    +---+----------------------------------------------+---+
                    |                                                      | * Statements
                    |                Sequentiële uitvoering                |    * Function+calls
                    |                                                      |    * Assignments
                    |   +------------+   +------------+   +------------+   | * Expressions
                    |   | Statements |   | Variabelen |   | Expressies |   | * Variables
                    +---+------------+---+------------+---+------------+---+
~~~

### Functies => hergebruik

Het **sleutelwoord** bij **functies** is **hergebruik**

We hebben we al **eerder** **hergebruik** gezien ... namelijk met **variabelen**.  
**Variabelen**

* voorzien **hergebruik** van **data/geheugen** 
* **tussen** verschillende **statements**
* en je kan via de naam deze variabelen gebruiken

Nu bekijken we **ander soort hergebruik**, namelijk **hergebruik van statements** of functionaliteit.


### Ingebouwde functies

Python heeft een aantal **ingebouwde functies** die we reeds hebben gebruikt.  
We hebben al eerdere functies gebruikt zoals input, int, str en print:

~~~python
# input() gets a string from the user
input_a = input("Number a: ")
# int() converts the input-string into an int we can use to calculate
a = int(input_a) 
# str() converts an int back to a string
output_a = str(a + 1)
# the concatenated result is printed back through the string-function
print(input_a + " + 1  = " + output_a)
~~~

### Gebruiken van functies

Om een functies te gebruiken gebruik je de **naam**, **gevolgd** door **haakjes**.

~~~python
an_example_function()
~~~

Van deze functie kan je (optioneel) een **waarde opvangen** in een variabele, we noemen dit ook 

~~~python
result = an_example_function()
~~~

Daarnaast kan je een **argument** meegeven die door de functie wordt gebruikt om iets mee te doen (zoals een bewerking)

~~~python
result = an_example_function(1)
~~~

Je ben ook niet beperkt tot 1 argument, een functie kan van **0 tot oneindig aantal argumenten** opvragen.

~~~python
result = an_example_function(1,2)
~~~

Deze argumenten zijn "by default verplicht" maar sommige functies hebben ook nog optionele argumenten (we komen hier zo dadelijk op terug...)

### Gebruik Python-modules

int(), str(), print(), input() zijn direct beschikbaar in Python  
Andere - meer gespecialiseerde - functies zijn gegroepeerd in modules

Bijvoorbeeld als je wiskundige functies wil gebruiken heb je de math module


~~~python
import math
print(math)
degrees = 45
radians = degrees / 360.0 * 2 * math.pi
math.sin(radians)
math.sqrt(2) / 2.0
~~~

~~~python
import random

for i in range(10):
    x = random.random()
    print(x)
~~~

~~~python
random.randint(5, 10)
~~~


~~~
+---------------------+
|                     |
|  Module             |
|                     |
|   +------------+    |
|   | Functie    |    |
|   +------------+    |
|                     |
|   +------------+    |
|   | Functie    |    |
|   +------------+    |
|                     |
|   +------------+    |
|   | Functie    |    |
|   +------------+    |
|                     |
+---------------------+
~~~

### Werken met functies

Functies in python hebben 2 grote verschillen:

* Ze starten met het keyword "def"
* Zoals andere blocks geen accolades
     * Functie-definitie eindigt met ":"
     * Inhoud van de functie wordt geindenteerd

~~~python
def greeting():
    print("hello ")
    print(" from bart") 
~~~

~~~python
def greeting():
    print("hello ")
    print(" from bart") 
greeting()
~~~


~~~python
def greeting(name):
    print("hello ")
    print(" from " + name) 
greeting("Bart")
~~~

~~~python
def greeting(name):
    print("hello ")
    print(" from " + name) 
greeting("Bart")
greeting("Fons")
~~~


~~~python
def greeting(name,surname):
    print("hello ")
    print(" from " + name + " " + surname) 
greeting("Bart")
~~~


~~~python
def polite_conversation(surname,last_name):
    print("hello ")
    print(" from " + surname + " " + last_name) 
    name = input("What's your name?")
    return name
polite_conversation("bart","voet")
~~~



~~~python
def greeting(name,surname):
    print("hello ")
    print(" from " + name + " " + surname) 

def polite_conversation(surname,name):
    greetin(surname,name)
    name = input("What's your name?")
    return name
polite_conversation("bart","voet")
~~~

### header en body

### block

### Uitvoering van functies

### Functie zijn geen statements

### Waarom functies?