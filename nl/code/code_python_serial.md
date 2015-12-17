## Bedoeling van dit hoofdstuk

We hebben recentelijk gezien hoe we vanuit de MCU/AVR kunnen communiceren met een computer.  
Dit was mogelijk over een seriële vebinding waar we een ftdi-converter gebruikten om de conversie tussen uart en usb te doen.  

Het doel van deze les is van nog iets verder gaan en een **applicatie** op je computer te bouwen.
Bedoeling hiervan is de microcontroller aan te sturen besturen over een **seriele connectie**.  

## Python leren in een c-cursus?

We gaan hier geen C (voor het pc-gedeelte) voor gebruiken maar **Python**.
Waarom nog een andere taal leren?

* "Using the right tool for the job"  
     * C is een taal die wordt gebruikt om systeem-software (mcu, drivers, os, ...) te gebruiken  
     (bazooka om een mug klein te krijgen)
     * Python is een taal gebruikt om kleine tot grote applicaties
* Python is zeer éénvoudig aan te leren
* Scripting-gebaseerd
* Open-source en vrij beschikbaar
* Imens populair

## Waarschuwing: crashcourse

Deze uitstap naar Python is te beschouwen als een **intro**, niet meer.  
Bedoeling is enkel het minimum aan te leren om een korte support-applicatie te schrijven voor je MCU.

## Installatie

Bij deze gaan we python 2.7 installeren.  
Er bestaat ook python 3 maar deze is niet volledig compatibel met 2.7 (en 2.7 is momenteel nog het meest gebruikt)

### Linux

Python is by default geïnstalleerd op vrijwel elke Linux-distributie.

Voor de 2 volgende aptitude-commando's uit om support voor tk (gui) en seriële connecties te gebruiken:

~~~
$ sudo apt-get install python-tk
...
$ sudo apt-get install python-serial
...
~~~


### Mac

Voor Mac OS X voer je 3 acties uit:

* Installeren van python zelf  
  https://www.python.org/ftp/python/2.7.10/python-2.7.10-macosx10.6.pkg
* Installeren van gui  
http://www.activestate.com/activetcl/downloads/thank-you?dl=http://downloads.activestate.com/ActiveTcl/releases/8.5.18.0/ActiveTcl8.5.18.0.298892-macosx10.5-i386-x86_64-threaded.dmg
* Installeren van pyserial
     * Download vanaf https://pypi.python.org/pypi/pyserial
     * Je krijgt tar-file, deze kan je gewoon extracten vanaf de command-line
     * python setup.py install

### Windows

* Installeren van python  
https://www.python.org/ftp/python/2.7.10/python-2.7.10.amd64.msi
* Installeren van gui  
http://www.activestate.com/activetcl/downloads/thank-you?dl=http://downloads.activestate.com/ActiveTcl/releases/8.6.4.1/ActiveTcl8.6.4.1.299124-win32-x86_64-threaded.exe

Download vanaf https://pypi.python.org/pypi/pyserial
http://www.7-zip.org/
c:\Python27\Lib\pyserial-2.6\
python setup.py install

## Starten met python: File of repl-modus

Aan de basis is python een scripting-taal.  
Scripting-talen kunnen (meestal) uitgevoerd worden met 2 modi:

* Rechtstreeks op command-line  
  (ook wel repl or Read–eval–print loop genoemd)
* Als file (alle commando's worden direct na elkaar uitgevoerd)

## REPL tov files

Python kan worden uitgevoerd onder 2 modi:

### REPL-modus

Je kan python-code (statements) rechtstreeks vanuit een interactieve shell uitvoeren.  
Het is voldoende om naar de command-line te gaan (cmd of bash afhangende van je OS)

Het volgende voorbeeld zal het zinnetje hello afdrukken:

~~~{.py}
$ python
>>> print("hello")
hello
>>> exit()
$
~~~

Om uit deze interactieve shell te geraken typ je exit() (gevolgd door enter) en je komt gewoon terug op de command-line.  
Bij deze had je ook de python-functie leren kennnen, namelijk print om een stuk tekst naar de console te printen.

Je zie dat het aanroepen van een methode heel veel lijkt op de manier zoals we dat in c deden

### FILE-modus

In het geval je een programmatje wil bouwen, is het interessant deze "statements" sequentieel in een file te plaatsen (zoals we tot nog toe bij C hebben gezien).  
Dit doe je door een file te creeren met een text-editor (gedit, notepad++, vi, ...), bijvoorbeeld met de volgende inhoud.   

~~~{.py}
print("hello")
print("world")
~~~

Deze file eindigt per conventie op de extensie py (in het voorbeeld noemen we deze hello.py)

~~~
$ python hello.py
hello
world
$
~~~

## Python-syntax

### Aanroepen van methodes

Zoals je bij vorige stukken hebt gezien is het aanroepen van een methode heel gelijkaardig aan hoe we dat in c kennen:

* een naam 
* gevoldd door 1 of meerdere argumenten tussen haakjes
* Argumenten gescheiden door ;

Later zien we hoe we onze eigen functies aanmaken.

### Een variabele

Nu dat we éénmaal weten hoe te printen, introduceren we variabelen.  
Net zoals bij C kan je een waarde in het geheugen plaatsen onder de vorm van een variabele.  
Deze variabele kan je meegeven aan  

~~~{.py}
>>> say_hello = "hello"
>>> print(say_hello)
>>>
~~~

De variabele die je nu hebt gezien is van het type string (net zoals je ook zo'n type in C hebt).  
Let ook op het feit dat je geen type moeten aanduiden bij declararatie van zo'n variabele.

Je kan ook zo'n variabele deleten in python als je deze niet meer nodig hebt (om geheugen te besparen)

~~~{.py}
>>> say_hello = "hello"
>>> print(say_hello)
hello
>>> del say_hello
>>> print(say_hello)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'say_hello' is not defined
>>> 

~~~

### Data-types

Naast het type string heb je ook support voor allerlei 

* Integers  
  —1, –3, 42, 355, 888888888888888, –7777777777
* Floats  
  —3.0, 31e12, –6e-4
* Complex numbers  
  —3 + 2j, –4- 2j, 4.2 + 6.3j
* Booleans  
  True, False

### Operations
~~~
>>> x = 5 + 2 - 3 *2
>>> x
>>> 1
>>> 5 / 2
>>> 2 ## in python 3 2.5
>>> 5 // 2 ## enkel in python 3
>>> 2
>>> 2 ** 8
>>> 256
~~~

### Een variabele en formatting

~~~{.py}
>>> x = 5
>>> print '{} {} {}'.format(x, x*x, x*x*x)'
~~~


~~~{.py}
>>> x = 5
>>> print '{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x)'
~~~

> Nota:  
> In dit geval zien we dat we dat we een methode aanroepen op een manier die we nog niet kennen vanuit C, namelijk vanuit een object (string.methode()).  
> Dit is Object Georienteerd programmeren, hier komen we zoda

### Input inlezen vanuit je script

~~~{.py}
>>> x = 5
>>> print '{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x)'
~~~

### Inlezen

~~~{.py}
x = input("Geef een string")
print x
~~~

### Inlezen en converteren

~~~{.py}
x = int(input("Geef een nummer"))
print '{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x)'
~~~

### C vs python blocks

We starten direct aan meer complexere code (condities en herhalingen).  
We zullen eerst even basis van de syntax in python vergelijken tov deze van C:

* tab gebaseerd  
  (tov accolades die worden gebruikt voor blocks te onderscheiden)
* geen type nodig voor een variabele  
  (in c moet je altijd een type aangeven)
* case sensitive  
  net zoals in c vanzelfspreken
* oo (zie we niet vandaag)

In c:

~~~{.c}
int n, r;
n = 9;
r = 1;
while (n > 0) {
    r *= n;
    n--;
}
~~~

In python:

~~~{.py}
n = 9
r = 1
while n > 0:
    r *= n
    n -= 1
~~~

### Strings

In python wordt er geen onderscheid gemaakt tussen een karakter en een string:

~~~{.py}
>>> a = "A string in double quotes can contain 'single quote' characters."
>>> b = 'A string in single quotes can contain "double quote" characters.'
>>> c = '''\This string starts with a tab and ends with a newline character.\n'''
>>> d = """This is a triple double quoted string, the only kind that can
    contain real newlines."""
>>> 
~~~

### Commentaar

Waar je in C ~~~//~~~ en ~~~/**/~~~ gebruikt om je code te becommentariëren bestaan er in python de 2 volgende manieren:

Of je gebruikt een hashbang:
~~~{.py}
# This is python-comment
~~~

Of je zet een multi-line string zonder hem aan een variabele te assignen
~~~{.py}
"""This is a multiline comment.
The following lines concatenate the two strings."""
~~~

## Condities en herhalign

### If

~~~{.py}
if expression:
   statement(s)
else:
   statement(s)
~~~


~~~{.py}
a = 10
if a > 10:
   print("a > 10")
else:
   print("a <= 10")
~~~

### ElIf

~~~{.py}
a = 10
if a > 10:
   print("a > 10")
elif a == 10:
   print("a == 10")
else:
   print("a > 10")
~~~

## While

~~~{.py}
while condition:
    body
else:
    post-code
~~~

~~~{.py}
x = 5
y = 10
while x > y:
    print(x)
    x = x + 1 
~~~

## While met else

~~~{.py}
x = 1;
while x < 10:
    print(x)
    x = x + 1
else:
    print("deze code wordt altijd uitgevoerd")
~~~

~~~{.py}
x = 10;
while x < 10:
    print(x)
    x = x + 1
else:
    print("deze code wordt altijd uitgevoerd")
~~~

### For-loop

~~~{.py}
for x in range(1,11):
     print '{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x)'
~~~

### Nesten van codities en herhaling

~~~{.py}
for x in range(1,11):
    for y in range(x,11):
        if x != y:
            print('{0:3d}'.format(x))
            print('{0:3d}'.format(y))
            print("*--")
            print('{0:3d}'.format(x * y))
            print("")
~~~

## Lijsten

~~~{.py}
x = [1.0, 2.0, 3.0]
print(x[1])
~~~

### Lijsten doorlopen

~~~{.py}
x = [1.0, 2.0, 3.0]
for n in x:
    print(n)
~~~

### Slicing

~~~{.py}
x = [0,1,2,3,4,5,6,7,8,9]
print(x[-1])
print(x[-3])
~~~


### Slicing

~~~{.py}
x = [0,1,2,3,4,5,6,7,8,9]
for n in x[2:4]:
    print(n)
~~~

~~~{.py}
x = [0,1,2,3,4,5,6,7,8,9]
for n in x[2:-2]:
    print(n)
~~~

## Functies

### Formaat

~~~{.py}
def name(parameter1, parameter2, . . .):
    body
~~~

### Functie met 1 argument

~~~{.py}
def table_of_powers(until):
    for x in range(1,until):
         print '{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x)

table_of_powers(10)
~~~

### Functie met 2 argumenten en return

~~~{.py}
>>> def macht(x,y):
...     return x**y
... 
>>> print(macht(5,6))
15625
~~~

## Classes

~~~{.py}
class MyClass:
    body
~~~

### Voorbeeld

~~~{.py}
class Circle:
    def __init__(self,rad):
        self.radius = rad
    def area(self):
        return self.radius * self.radius * 3.14159

circle = Circle(10)
print(circle.area())
~~~

## Schermen

![](../../pictures/python_project.png)

### Voorbeeld 1 

~~~{.py}
from tkinter import *
import sys
win = Tk()
button = Button(win, text="Goodbye", command=sys.exit)
button.pack()
mainloop()
~~~

### Voorbeeld 2

~~~{.py}
from Tkinter import *

def increment_led_0():
    print("increment led 0")

def increment_led_1():
    print("increment led 1")

def decrement_led_0():
    print("decrement led 0")

def decrement_led_1():
    print("decrement led 1")

def set_value_led_0(value):
    print("set value led 0")

def set_value_led_1(value):
    print("set value led 1")

master = Tk()

Button(master,text='-').grid(row=0,column=0)
w = Scale(master, from_=1, to=10,command=set_value_led_0,orient=HORIZONTAL)
w.grid(row=0,column=1)
Button(master,text='+').grid(row=0,column=2)
Button(master,text='-').grid(row=1,column=0)
w = Scale(master, from_=1, to=10,command=set_value_led_1,orient=HORIZONTAL)
w.grid(row=1,column=1)
Button(master,text='+').grid(row=1,column=2)

mainloop()
~~~

### Voorbeeld 3

~~~{.py}
from Tkinter import *

class Led:
    def __init__(self,master,led_number):
        self.led_number = led_number
        row_number = self.led_number        
        Button(master,text='-',command=self.decrement_led).grid(row=row_number,column=0)
        self.scale = Scale(master, from_=1, to=10,command=self.set_value_led,orient=HORIZONTAL)
        self.scale.grid(row=row_number,column=1)
        Button(master,text='+',command=self.increment_led).grid(row=row_number,column=2)

    def increment_led(self):
        print("increment led {}".format(self.led_number))

    def decrement_led(self):
        print("decrement led {}".format(self.led_number))

    def set_value_led(self,value):
        print("set value led {} to value {}".format(self.led_number,value))

master = Tk()
led = Led(master,0)
led = Led(master,1)
mainloop()
~~~

### Voorbeeld 3

~~~{.py}
from Tkinter import *
from serial

class SerialConnection:
    def __init__(self,connection_string,baud):
        self.ser = serial.Serial(port=connection_string,baudrate=baud)

    def write_command(self,command):
        self.ser.write(command)
        val = self.ser.readline()
        return val.split(';')[1]

class Led:
    def __init__(self,master,serial,led_number):
        self.led_number = led_number
        row_number = self.led_number        
        Button(master,text='-',command=self.decrement_led).grid(row=row_number,column=0)
        self.scale = Scale(master, from_=1, to=10,orient=HORIZONTAL)
        self.scale.grid(row=row_number,column=1)
        Button(master,text='+',command=self.increment_led).grid(row=row_number,column=2)
        self.command("get({})".format(self.led_number))
        
    def command(self,com):
        val = serial.write_command(com) 
        self.scale.set(val)

    def increment_led(self):
        self.command("up({})".format(self.led_number)) 

    def decrement_led(self):
        self.command("down({})".format(self.led_number)) 

master = Tk()
serial = SerialConnection('/dev/serial/by-id/pci-Arduino__www.arduino.cc__Arduino_Uno_64935343333351F08192-if00',9600)
led = Led(master,serial,0)
led = Led(master,serial,1)

mainloop()
~~~

Code die hier mee praat aan AVR-kant

~~~{.c}
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "serieel.h"


#define MAX_COMMAND_SIZE  100

int read_command(char* line)
{
    int i = 0;
    while(1) {
      line[i] = serial_receive_byte();
      if (line[i] == ')' || i >= MAX_COMMAND_SIZE) break;
      i++;
    }
    line[i] = 0;
    return i-1;
}

char leds[] = {5,5};

int up(char* line)
{
    switch(line[3]) {
        case '0' : if(leds[0]<10) leds[0]++;return 0;
        case '1' : if(leds[1]<10) leds[1]++;return 1;
    }
    return -1;
}

int down(char* line)
{
    switch(line[5]) {
        case '0' : if(leds[0]>0) leds[0]--;return 0;
        case '1' : if(leds[1]>0) leds[1]--;return 1;
    }
    return -1;
}

int get(char* line)
{
    switch(line[4]) {
        case '0' : return 0;
        case '1' : return 1;
    }
    return -1;
}

void adapt_pwm(char number) {
    switch(number) {
        case 0 : OCR1A = 0xFFFF / 10 * leds[number];break;
        case 1 : OCR1B = 0xFFFF / 10 * leds[number];break;
    }
}

void execute_command(char* line)
{
    int led = -1;
    if(strncmp(line,"up",2) == 0) {
        led = up(line);
    } else if(strncmp(line,"down",2) == 0) {
        led = down(line);
    } else if(strncmp(line,"get",2) == 0) {
        led = get(line);
    }

    if(led >= 0) {
        serial_send_number(led);
        serial_send_byte(';');
        serial_send_number(leds[led]);
        serial_send_byte('\n');
    }
}

int main(void) {
    DDRB |= (1 << DDB1) | (1 << DDB2); // PB1 and PB2 als output

    ICR1 = 0xFFFF; //TOP-waarde op 16-bit

    //Je hebt 2 uitgangen die je kan laten uitgaan bij ...
    OCR1A = 0xFFFF; // 25% duty cycle PB1
    OCR1B = 0xBFFF; // 75% duty cycle @ 16bit
    //TOP = 0xFFFF


    TCCR1A |= (1 << COM1A1) | (1 << COM1B1); // none-inverting mode

    // FAST PWM mode (16-bit) met ICR1 as TOP    1110
    TCCR1A |= (1 << WGM11);
    TCCR1B |= (1 << WGM12) | (1 << WGM13);

    // Voorlopig geen prescaler nodig (volle snelheid)
    TCCR1B |= (1 << CS10);

    serial_initialise();



    while (1) {
        char line[MAX_COMMAND_SIZE];
        read_command(line);
        execute_command(line);
        adapt_pwm(0);
        adapt_pwm(1);
    }
    return 0;
}
~~~




