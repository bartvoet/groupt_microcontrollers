## Labo: eenvoudige loops en condities

### Opdracht 1

Wijzig het bestaande programma uit de cursus

```
#include <stdio.h>

void main()
{
    int input;
    printf("Gelieve een getal in te geven: ");
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
#### Deel A
Zorg dat het programma nakijkt of het een deler is van het getal en pas de boodschap op het scherm aan.  
Dit deler-getal wordt aan de start van het programma ingegeven.  

#### Deel B
Zorg ervoor dat het programma een booschap als geeft dat hij dit niet kan nakijken omdat het getal kleiner is dan het "deel-getal".   

#### Deel C
Laat dit programma herhalen zolang je niet het getal 1 ingeeft karakter ingeeft



### Opdracht 2

#### Deel A
Print een binaire representatie af van een getal (zie lessen combinatorische en als je er niet uitgeraakt vraag maar aan de docent :))

#### Deel B
Breidt dit uit door een knight-rider te simuleren

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

Deel C
Inverteer dit

### Opdracht 3 (optioneel)

#### Daal A
Teken de kerstboom na aan de hand van een loopeen kerstboom met het karakter '*'.
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

Maak een programma dat nakijkt of een getal een priemgetal is

