## Werken met tekst

### Data-type String

Eerder hebben we reeds kennisgemaakt met het dataype string in Python.  
Een korte herhaling van wat we al gezien hebben

### String als literal

Je kan deze gebruiken als literal:

~~~
text = "Hello World"
print(text)
~~~

### Opvragen van tekst over console

Je kan tekst opvragen van de console met de input-methode

~~~
name = input("Geef naam aub")
print(name)
~~~

### String-concatenatie

Je kan via de +-operator verschillende strings concateneren

~~~
text = "Hello"
print(text + " world")
~~~

### Concatenatie met Strings

En je kan zelf concateneren met andere data types

~~~
text = "Hello"
a_number = 2
print(text + " world" + str(5))
~~~

### String vermenigvuldigen

Naast de +-operator heb je ook de \*-operator

~~~
print("Hello " * 2)
~~~

### ASCII

~~~
Dec Hex    Dec Hex    Dec Hex  Dec Hex  Dec Hex  Dec Hex   Dec Hex   Dec Hex  
  0 00 NUL  16 10 DLE  32 20    48 30 0  64 40 @  80 50 P   96 60 `  112 70 p
  1 01 SOH  17 11 DC1  33 21 !  49 31 1  65 41 A  81 51 Q   97 61 a  113 71 q
  2 02 STX  18 12 DC2  34 22 "  50 32 2  66 42 B  82 52 R   98 62 b  114 72 r
  3 03 ETX  19 13 DC3  35 23 #  51 33 3  67 43 C  83 53 S   99 63 c  115 73 s
  4 04 EOT  20 14 DC4  36 24 $  52 34 4  68 44 D  84 54 T  100 64 d  116 74 t
  5 05 ENQ  21 15 NAK  37 25 %  53 35 5  69 45 E  85 55 U  101 65 e  117 75 u
  6 06 ACK  22 16 SYN  38 26 &  54 36 6  70 46 F  86 56 V  102 66 f  118 76 v
  7 07 BEL  23 17 ETB  39 27 '  55 37 7  71 47 G  87 57 W  103 67 g  119 77 w
  8 08 BS   24 18 CAN  40 28 (  56 38 8  72 48 H  88 58 X  104 68 h  120 78 x
  9 09 HT   25 19 EM   41 29 )  57 39 9  73 49 I  89 59 Y  105 69 i  121 79 y
 10 0A LF   26 1A SUB  42 2A *  58 3A :  74 4A J  90 5A Z  106 6A j  122 7A z
 11 0B VT   27 1B ESC  43 2B +  59 3B ;  75 4B K  91 5B [  107 6B k  123 7B {
 12 0C FF   28 1C FS   44 2C ,  60 3C <  76 4C L  92 5C \  108 6C l  124 7C |
 13 0D CR   29 1D GS   45 2D -  61 3D =  77 4D M  93 5D ]  109 6D m  125 7D }
 14 0E SO   30 1E RS   46 2E .  62 3E >  78 4E N  94 5E ^  110 6E n  126 7E ~
 15 0F SI   31 1F US   47 2F /  63 3F ?  79 4F O  95 5F _  111 6F o  127 7F DEL
~~~

### String literals

~~~
a = "A string in double quotes can contain 'single quote' characters."
b = 'A string in single quotes can contain "double quote" characters.'
c = '''\This string starts with a tab and ends with a newline character.\n'''
d = """This is a triple double quoted string, the only kind that can
    contain real newlines."""

~~~


### Enkele vs dubbele quotes

### """3 quotes""" 

### Lengte van stringhe

### Concatenatie van strings

Zoals eerder vermeld zin

Meerdere argumenten aan print

### hexbyt

### Formatteren van een string

De nieuwe manier, die zowel in Python 2 als Python 3 gesupporteerd:

~~~python
>>> print("{:d}-{:d}".format(1,2))
1-2
>>> print("{}-{}".format(1,2))
1-2-1
~~~

Bij dezei (nieuwe) manier ben je niet verplicht een formaat aan tegen een {} is voldoende.  
Optioneel kan je - binnen de string selecteren - welk getal uit de luist je wil selecteren:

~~~python
>>> print("{0}-{1}-{0}".format(1,2))
1-2-1
>>> print("{0:d}-{1:d}-{0:d}".format(1,2))
1-2-1
~~~

Een ander voorbeeld is het uitlijnen van tekst.

~~~python
>>> print("{0:2d}{1:3d}{0:4d}".format(1,2))
 1  2   1
>>> print("{0:2d}{1:3d}{0:4d}".format(10,20))
10 20  10
~~~

Voor een volledig overzicht kan je naar de betreffende python-documentatie gaan kijken:  
https://docs.python.org/2/tutorial/inputoutput.html


> Nota:  
> In dit geval zien we dat we dat we een methode aanroepen op een manier die we nog niet kennen vanuit C, namelijk vanuit een object (string.methode()).  
> Dit is Object-Georienteerd programmeren, hier komen zo direct nog even op terug



### Knippen van strings

### String is een collectie

### Zoeken in een string
