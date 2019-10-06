# Herhalings-oefeningen

Hieronder vindt je een lijst van herhalingsoefeningen om je voor het examen te kunnen voorbereiden.  
Deze vragen zijn onderverdeeld in 5 categorien: 

* 1 => "poepsimpel"
* 2 => "basis"
* 3 => "gemiddeld"
* 4 => "uitdagend"
* 5 => "niet te doen"

Je vindt deze quotatie bij naast de titel van elke oefening (tussen haakjes).
Op het examen zal er van 1 tem 4 vragen worden gesteld.  
Een bonusvraag van niveau 5 zal voorzien worden als shiftings-vraag als je met de andere vragen op 100% zit.

## Hoogste waarde (1-2)

### Functie die de hoogste waarde teruggeeft (1)

Schrijf een functie die de hoogste waarde van 2 getallen teruggeeft.  
Voorbeelden gebruik:

```c
printf("%i\n",max_of_2(2,5)); //prints 5
printf("%i\n",max_of_2(2,2)); //prints 2
```

### Min/max voor een array (2)

Schrijf een 2 functies die de hoogste en laagste waarden uit een array haalt.  
Deze functies hebben 2 argumenten nodig:

* De array zelf
* De lengte van de array (zie in de cursus voor het waarom...)

```c
int numbers []= {1,-5,9,10,1};
printf("%i\n",max(numbers,5)); //prints  10
printf("%i\n",min(numbers,5)); //prints -5
```

De lengte is "hard-coded" als 5, hoe kan je deze meegeven zonder deze handmatig in te geven?

### Min/max MACRO's (3)

Schrijf macro's die de functies uit voorgaande opdract aanroepen en er voor zorgen dat je geen lengte van array moet meegeven

```c
int numbers []= {1,-5,9,10,1};
printf("%i\n",MAX(numbers)); //prints  10
printf("%i\n",MIN(numbers)); //prints -5
```
 
## Print maand af (3)

Schrijf een functie die - als je deze aanroept -  de maand zelf afdrukt.

```c
print_month(2);   //drukt "Februari" af
print_month(13);  //drukt "13 onbekend"
print_month(0);  //drukt "0 onbekend"
print_month(3);  //drukt "Maart" af
```

Zorg ervoor dat deze "x onbekend" afdrukt, waar je x vervangt door de maand zelf.

### advh switch-statement (2)

Implementeer deze functie adhv een switch-statement

### advh array (3)

Implementeer deze functie adhv een array.  
Vergelijk de lengte van de array met een het argument (gebruik SIZEOF hiervoor.) 

## Temperatuur (1)

Schrijf 2 functies:

```c
int celsius_2_farenheit(int degrees)
int farenheit2celcius(int degrees)
```

Die graden celsius converteren naar farenheit en omgekeerd

```c
celsius = (xfarheit  - 32) * 5
```
## Array-manipulaties

### Array-copy (2)

Schrijf een programma dat de inhoudt van een array in een andere copieert.
Bewijs dit door beide arrays af te drukken

### Array-sort (4)

* Maak een array van getallen aan in een main-functie.  
* Maak een 2de lege array aan van de zelfde lengte
* Sorteer de inhoud van de 1ste array in de 2de array

### Arrays vermenigvuldigen met elkaar (3)

Schrijf:

* een functie multiply_arrays
    * waar je 2 arrays (argument 1 en 2) met elkaar vermenigvuldigt
    * resultaat opslaagt in de 3rde array (argument 3)
    * de grootte van deze arrays wordt meegeven als argument 4
* een 2de functie om het resultaat af te drukken
    * argument 1 is de array
    * argument 2 is de grootte van deze array

```
int s = 3;
int a[s] = {1,2,3};
int b[s] = {3,2,1};
int c[s] = {};

multiply(a,b,c,s);
print_array(c,s);  //zou "3 4 3" moeten afdrukken
```


## Binaire string (4)

Schrijf een functie met de naam str2bin die een binaire string converteert naar een getal.
Bijvoorbeeld onderstaande code resulteerd zal "0x55" afdrukken.

```c
unsigned int result = "01010101";
printf("%x\n",result);
```

> Tip: een string in C eindigt altijd met het karakter 0

## Bits tellen (2)

Maak een fucntie die het aantal bits telt die op 1 staan in een unsigned char.

## Bit-rotatie (4)

### Bit rotatie naar links (4)

Schrijf een functie die een unsigned char bits roteert naar de MSB "links".  
Volgend stappen/voorbeeld illustreren dit:

* Voorbeeld
    * rotatie met 2 bits 
    * van het getal 0x52 (binair 01010010)
* 2 linkse bits "01" ("01"010010) moet je "afknippen" van de linkerkant
* en bij plakken aan de rechterkant (010010"01")
* met als resultaat 01001001 of 0x49

```c
unsigned char base_number = 0X52;// => 01010010
printf("%x\n", bit_rotate_left(base_number,2); //print 0x49 af
printf("%x\n", bit_rotate_left(base_number,2); //print 0x49 af
```
Hou geen rekening met negatieve getallen en gebruik een unsigned char als 2de argument

> Tip: Getallen groter dan 8 kan je inkorten aan de hand van de rest-operator

### Bit-rotatie naar rechts (4)

Implementeer hetzelfde maar naar de LSB-richting...

## Register-simulatie (4)

Stel volgend register TCCR1B (1 byte), te vinden in de datasheet AVR

```
7      6       5       4        3       2       1       0
ICNC1  ICES1   -       WGM13    WGM21   CS12    CS11    CS10
```

Bit 0,1,2 worden gebruikt om de clock-source (en/of prescaling) te selecteren.

```
0 0 0 No clock source (Timer/Counter stopped).
0 0 1 clk I/O /1 (No prescaling)
0 1 0 clk I/O /8 (From prescaler)
0 1 1 clk I/O /64 (From prescaler)
1 0 0 clk I/O /256 (From prescaler)
1 0 1 clk I/O /1024 (From prescaler)
1 1 0 External clock source on T1 pin. Clock on falling edge.
1 1 1 External clock source on T1 pin. Clock on rising edge.
```

Bedoeling van deze oefening is 3 oefeningen te schrijven die kunnen gebruik worden om dit register te manipuleren/

### Schrijf een functie die de waarde terug-geeft van de clock-select

Schrijf een functie die de clock-select-bits teruggeeft

```c
unsigned char TCCR1B = 0x5B;
printf("%x\",get_chipselect(0x5B));//print 3 af
printf("%x\",get_chipselect(0x4A));//print 2 af
```

### Update clock-select

Schrijf een functie die de clock-select-bits aanpast

```c
unsigned char TCCR1B = 0x58;
printf("%x\",set_chipselect(TCCR1B,3));//print 0x5B af
printf("%x\",set_chipselect(TCCR1B,2));//print 0x5A af
```

### Print clock-select

Schrijf een functie die de overeenkomstige tekst uit bovenvermelde tabel afdrukt

```c
unsigned char TCCR1B = 0x5B;
printf("%x\",print_chipselect(0x5B));//print "clk I/O /64 (From prescaler)" af
printf("%x\",print_chipselect(0x4A));//print "I/O /8 (From prescaler)" af
```

Gebruik hiervoor de voorgaande get_chipselect in combinatie met een switch-statement.

## Leeftijden (2)

Maak een array met leeftijden aan.
Druk af (op basis van deze array):

* Som van leeftijden
* Gemiddelde van leeftijden
* Mediaan

## Getal-patronen

Afdrukken van getallen-patronen

### Patroon 1 (2)

Bij volgende aanroep

```c
print_pattern(4);
```

Moet je volgend resultaat bekkomen...

```
1
12
123
1234
```

### Patroon 1 (3)

Bij volgende aanroep

```c
print_pattern_2(4);
```

Druk je volgend resultaat af

```
   1
  121
 12321
1234321
```

## Punten en graden (3)

Gezien volgende mapping tussen percentage en graden

```
%       Graad
0-60    F
61-70   D
71-80   C
81-90   B
91-100  A
```

### Druk graad af (3)

Druk de graad af overeenkomstig de punten

```c
print_grade(55);//prints "F"
print_grade(100);//prints "A"
print_grade(105);//prints "INVALID"
```

### + of - (3)

Om aan te duiden of je beneden of boven-aan in je graad zit voeg je
aan voorgaande functie de logica toe om een + of - toe te voegen.

```c
print_grade(20);//prints "F-"
print_grade(55);//prints "F+"
print_grade(95);//prints "A-"
print_grade(96);//prints "A+"
print_grade(105);//prints "INVALID"
```

## Macro's

### Deelbaar door 10 (2)

Schrijf een macro die 1 terug-geeft als de  parameter deelbaar is door 10 en anders 0

```c
printf("%i\n", DIVIDABLE_BY_10(20));  //print 1 af
printf("%i\n", DIVIDABLE_BY_10(25));  //print 0 af
printf("%i\n", DIVIDABLE_BY_10(-30)); //print 1 af
```

### Deelbaar door (3)

Schrijf een gelijkaardige macro die 1 terug-geeft als de 1ste parameter deelbaar is door de 2de parameters en anders 0

```c
printf("%i\n", DIVIDABLE(20,10));  //print 1 af
printf("%i\n", DIVIDABLE_BY_10(10,3));  //print 0 af
printf("%i\n", DIVIDABLE_BY_10(-30,6)); //print 1 af
```

## SWAP (5)

Schrijf een macro die de waardes van 2 variabelen swapt zonder een tussen-variabele te gebruiken.

```c
unsigned char a = 5;
unsigned char b = 6;

printf("a = %i\n"); //print a = 5
printf("b = %i\n"); //print b = 6

SWAP(a,b);

printf("a = %i\n"); //print a = 6
printf("b = %i\n"); //print b = 5
```

> Tip: start hier enkel aan als je zeker bent dat je alle andere oefeningen kan...