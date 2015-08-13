## Labo: eenvoudige loops en condities

### Opdracht 1

In de cursus bespraken we dit onderstaande programma dat nakeek of een gegegeven getal:

* Positief of negatief is
* Even of oneven is
* Bij 0 een waarschuwing meegeeft (noch negatief/positief, even/oneven)

```
#include <stdio.h>

void main()
{
    int input;
    printf("Gelieve een getal in te geven: \n");
    scanf("%i",&input);
    if(input > 0) {
    	if((input % 2) == 0) {
    		printf("Het getal %i is een positief even getal",input);
    	} else {
    		printf("Het getal %i is een positief oneven getal",input);
        }
    } else if(input==0) {
	printf("Het getal %i is noch even of oneven",input);
    } else {
    	if((input % 2) == 0) {
    		printf("Het getal %i is een negatief even getal",input);
    	} else {
    		printf("Het getal %i is een negatief oneven getal",input);
        }
    }
}
```

Deze opdracht heeft als bedoeling een aantal wijzigingen aan dit programma aan te brengen om aldoende wat meer handigheid te verkrijgen met condities and loops.

#### Deel A

Momenteel kijkt dit programma na of het getal **even of oneven** is, met andere woorden dat 2 een deler is van het input-getal.    
Wijzig het programma opdat het **ipv** na te kijken of het input-getal **gedeeld** kan worden door **2** nakijkt of het gedeeld kan worden door **een ingegeven getal**.   
 
Dus ipv te testen dat het deelbaar is door 2, vraagt het programma bij het begin een getal om te testen zoals geïllustreerd hieronder:  

```
$ Gelieve een getal in te geven: 
$ 5
$ Gelieve een deel-getal in te geven:
$ 3
$ Het getal 5 is een positief getal maar niet deelbaar door 3
$
``` 

of

```
$ Gelieve een getal in te geven: 
$ - 8
$ Gelieve een deel-getal in te geven:
$ 4
$ Het getal -8 is een negatief getal en deelbaar door 4
$
``` 

#### Deel B
Laat dit programma zich herhalen waarbij je telkens opnieuw het input- en deel-getal opvraagt.  
Laat het programma stoppen als als je voor het input-getal 1 ingeeft.  

```
$ Gelieve een getal in te geven: 
$ - 8
$ Gelieve een deel-getal in te geven:
$ 4
$ Het getal -8 is een negatief getal en deelbaar door 4
$ Gelieve een getal in te geven: 
$ 1
$ Bij ingave van 1 stopt het programma
$ 
``` 

#### Deel C (optioneel)
Zorg ervoor dat het programma een boodschap als geeft dat hij dit niet kan nakijken omdat het getal kleiner is dan het "deel-getal".   
Een extra moeillijkheid is dat je hier hier de absolute waardes moet vergelijken:

* Maak 2 extra variabelen voor de absolute waardes bij te houden.
* Je kan deze absolute waarde berekenen doen door te testen als het getal < 0 de bewerking "0 - getal" uit te voeren
* Daarna kan je deze absolute waardes vergelijken en een boodschap geven

### Opdracht 2

#### Deel A
Print een binaire representatie af van een getal (zie lessen combinatorische en als je er niet uitgeraakt vraag maar aan de docent :))

Tips:

* Het afdrukken van 0 en 1 kan je via printf (```printf("0");``` en ```printf("1");```)
* Ter referentie 2 onderstaande tabellen stellen we 2 verschillende manieren voor om dit te bereiken 

**Manier 1:**

* Starten bij de grootste macht van 2 < input getal, deze door 2 blijven delen.  
* Als de (gedeelde) macht van 2 kleiner is dan het input (of zijn overschot) 
    * print je een 1 en trek je de macht af
    * anders print je 0
* Je eindigt als je bij 0 of 1 komt

| overschot | macht van 2 | input >= macht? | resultaat     |
|-----------|-------------|-----------------|---------------|
| 11        | 8           | 1               | 1             |
| 3         | 4           | 0               | 10            |
| 3         | 2           | 1               | 101           |
| 1         | 1           | 1               | **1011**      |
| 0         | -           | -               | -             |


**Manier 2:** 

* Blijf het input-getal blijven delen door 2
* Als er een rest is print je 1, anders print je 0
* Je doet dit totdat je aan 1 uitkomt.  

| overschot | delen door 2 | rest of niet? | resultaat |
|-----------|--------------|---------------|----------:|
| 11        | 5            | 1             |         1 |
| 6         | 3            | 0             |        01 |
| 3         | 2            | 1             |       101 |
| 1         | 2            | 1             |  **1011** |
| 0         | -            | -             |           |

Let wel:  
De laatste manier is eenvoudiger, maar je zal een omgekeerd resultaat bekomen, omdat je daar minst significante bit eerst print.  
Het is echter ook toegelaten deze manier te gebruiken (en een omgekeerd resultaat te bekomen als de eerste manier te moeilijk is).  

#### Deel B (optioneel)
Werk dit verder uit door het volgende af te printen door middel van een loop (starten van 1 en vervolgens maal 2).  
Je mag eventueel spaties printen ipv een 0 om een leuker effect te verkrijgen.  

```
00000001  
00000010  
00000100  
00001000  
00010000  
00100000  
01000000  
10000000  
01000000  
00100000  
00010000  
00001000  
00000100  
00000010  
00000001  
```


#### Deel C (optioneel)

Inverteer dit resultaat

### Opdracht 3 (optioneel)

Teken de kerstboom na aan de hand van een loop, een kerstboom met het karakter '*'.
Gebruik hiervoor loops.

```
     *  
    ***  
   *****
  *******  
 *********
***********  
     *  
     *
```

### Opdracht 4 (optioneel)

Maak een programma dat nakijkt of een getal een priemgetal is (aan de hand van een loop)

