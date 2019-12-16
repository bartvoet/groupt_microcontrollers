## Functies (deel 2)

### Optionele argumenten

Je kan voor een functie default waardes meegeven aan een argument.  
Dit kan interessant zijn in situaties waar je in vele gevallen al de waarde weet, maar hier wel wil kunnen van afwijken

~~~python
def power_of(base,exponent = 2):
    return base ** exponent

print(power_of(2))   # prints 4
print(power_of(2,2)) # prints 4
print(power_of(2,3)) # prints 8
~~~
### pass-statement

Python laat geen lege blocks toe.  
Onderstaande code is in python niet toegelaten

~~~python
def a_function_not_yet_impemented():

~~~

Als ook bij andere blocks (if,while, for, ...) is dit het geval

~~~python
a = input("give number")
if(a > 10):
    print("Number is bigger than 10")
else:
    # I need to think on the message
~~~

Als je dus nog niet weet wat te implementeren (en dus een lege block hebt) kan je een pass-statement toevoegen, in dat geva

~~~python
def a_function_not_yet_impemented():
    pass
~~~

### Access by name

Tot nu toe hebben we functies aangeroepen, door een lijst van argumenten mee te geven, gescheiden door komma's

Er is echter een 2de manier, namelijk de de parameters per naam door geven.

~~~python
def power_of(base,exponent = 2):
    return base ** exponent

print(power_of(base=2,exponent=4)) # prints 16
print(power_of(exponent=4,base=2)) # prints 16
print(power_of(2,exponent=4)) # prints 16
##print(power_of(base=2,4)) => not possible!!!
~~~

Je kan in dat geval zelfs kiezen in welke volgorde je deze meegeeft (als je per naam meegeeft).  

Je kan ook combineren met de gewone manier van argumenten passeren, maar dat kan dan enkel voor de laatste argumenten.

### kwargs

Sommige functies (oa print) kunnen een onbeperkt aantal argumenten aannemen.  
Je kan dit doen door een sterretje te plaatsen voor je argument.

~~~python
def print_students(*students):
    for student in students:
        print(student)

print_students("Jan", "Piet", "Joris","Korneel")
~~~

De argumenten zullen dan worden aangeleverd onder de vorm van een list.


### recursie

De volgende functie/code telt af vanaf 10

~~~python
def countdown_function(count):
    for i in range(count,0,count,-1):
        print(i + 1)

countdown_function(10)
~~~

Je kan deze ook recursief schrijven.

~~~python
def countdown_function(count):
    if(count > 0):
        print(count)
        countdown_function(count - 1)

countdown_function(10)
~~~
