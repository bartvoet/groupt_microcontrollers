## Eerste kennismaking met programmmeren

Programmeren is **moeillijk** en kan snel **demotiveren** bij de verkeerde en ongefundeerde aanpak.
In dit hoofdstuk proberen we dit te omzeilen door eerst de basis-concepten van een programma uit te leggen.  
In het eerste deel proberen we dit uit te leggen aan de hand van een visuele programmeertaal genoemd scratch.  

**Scratch** voorzien een rijke leer-omgeving voor mensen van 10 tem 99 (of ouder).
Het laat je to zeer snel interactieve, media-applicaties te maken (inclusief animaties, spelletjes, ...)  

Het is de ideale manier om in 1 les (theorie + praktijk) een overview te geven van de belangrijkste elementen van programmeren (hetgeen anders niet mogelijk is).  

Na deze introductie (en labo-oefeningen) hernemen passen deze concepten toe op de C-programmeer-taal.  

> Opmerking:  
Dit is enkel ter introductie elk van deze elementen wordt dieper ingegaan gedurende de cursus.

## Basis-elementen van een progamma
![basis structuur programma](../pictures/basic_structure_programm.png)

Een programma is een...
* Opeenvolging van een aantal instructies die kunnen worden  
* Uitgevoerd door een verwerkingseenheid (processor).
* Het is een algoritme uitgewerkt in een programmeertaal

Een computersysteem bestaat uit 3 hoofddelen:
* Invoer apparaten (muis, toetsenbord…)
* Een verwerkingseenheid (processor)
* Uitvoer apparaten (scherm, printer…)

## Ontwikkelen van een programma

1. Probleem definitie
2. Probleem analyse
3. Opstellen algoritme(n)
4. Schrijven van broncode
5. Builden van broncode
6. Testen en debuggen van broncode


### Voorbeeld 1: body en statements
```
#include <stdio.h>
int main ()
{
    printf("Hello world");
    printf(" is een typisch voorbeeld-programma");
}
```
* Een klassiek c-programma begint meestal met
   * ```#include <stdio.h>```
   * ```int main()```  
Later echter meer over deze 2 lijnen, neem voorlopig aan dat deze nodig zijn voor een klassiek console applicatie
* Een c-programma is een opeenvolging van een aantal statements in dit geval:  
  * ```printf("Hello world")```
  * ```printf(" is een typisch voorbeeld-programma")```
* Elk van deze statements wordt gescheiden door een punt-komma
  * ```;```
* De opsomming van deze eigenlijke statements binnen een c-programma noemen we de body en staan altijd tussen accolades  
  * ``` {...}```

```
#include <stdio.h>
int main ()
{
    int getal1 = 5; 	// Geheel getal 1 = 5
    int getal2 = 7;	// Geheel getal 2 = 7
    int som = getal1 + getal2;
    printf("Het resultaat is: %i",som);
}
```

### Illustratie met scratch  

![Mogelijkheden met scratch](../pictures/scratch_code_bloks.png)

#### Beslissingen  
#### Herhalingen  
#### Variabelen en data-types  
#### Input en output  
#### Functies en procedures  
#### Events  
#### Arrays en lijsten  

### Toegepast in C  
#### Beslissingen  
#### Herhalingen  
#### Variabelen en data-types  
#### Input en output  
#### Functies en procedures  
#### Events  
#### Arrays en lijsten  
