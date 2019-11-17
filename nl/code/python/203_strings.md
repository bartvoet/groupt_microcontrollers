## Werken met tekst

### ASCII

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
