## Introductie in programmmeren

Programmeren kan **moeillijk** zijn en kan snel **demotiveren** bij de verkeerde en ongefundeerde aanpak.  

Om deze reden pakken we dit stap-voor-stap en starten we enkel met de absolute basis:
* Basis-structuur van een applicatie
  * Variabelen en constanten
  * Statements en expressies
  * Assignments
* Input en output verweken van een command-line

In dit eerste hoofdstuk proberen we dit te omzeilen door eerst de basis-concepten van een programma uit te leggen.  

### Wat doet een programma (vanop 10000 meter hoogte)?
Een programma (en software in het algemeen) is in essentie:

* een (of meerdere) **bestand**(en)  die een welbepaalde **sequentie van instructies** bevatten
* die door een **computer** (meer bepaald een processor) worden **uitgevoerd**.

![](../pictures/intro_external_logical_computer_view.png)

Een **CPU (processor)** is in een computer verantwoordelijk voor het 1 voor 1 verwerken van deze instructies en heeft toegang tot een geheugen voor het opslaan van data.

### Soorten van instructies  

Binnen zo een programma zijn er verschillende soorten instructies:  

* Berekeningen maken
* Afdrukken van het resultaat op een scherm of een andere medium
* Herhalen van instructies
* Aanroepen van functies en procedures
* Enkel uitvoeren van deze instructies onder bepaalde voorwaarden
* Lezen van randapparatuur (bv. scherm, toetsenbord, ...)  
* ...

![](../pictures/basic_structure_programm.png)

> In somige gevallen kunnen deze instructies zelfs pas opgeroepen worden bij bepaalde events (wordt pas binnen een paar lessen besproken)

### Programmeertalen

Hoe dat dit in zijn werk gaat bekijken we aan de hand van een programmeertaal.  
Er bestaan veel verschillende programmeer-talen zoals C, C++, Java, Python, C#, ...

Voor deze cursus gaan we dit bekijken aan de hand van de programmeertaal C, momenteel nog altijd de meest gebruikte programmeertaal in de wereld van microctrollers en embedded programming.

### Programmeer-taal C

In praktijk start een C-programma zijn leven als 1 (of meerdere) tekst-files.
Voor dit aan te maken heb je niet meer nodig dan een teksteditor (zoals bv. notepad, vim, notepad++, emacs, ...) zoals geillustreerd hieronder:

![](../pictures/intro_printscreen_of_editor.png)

##### Compileren en linken
Deze tekst kan je echter niet direct door een CPU laten uitvoeren.  
Alvorens je dat programma kan uitvoeren op het platform naar keuze (computer, microcontroller ...) moet deze tekst-file getransformeerd worden naar een uitvoerbare binaire file (in het geval van C).  

![](../pictures/intro_position_of_writing_code.png)

Deze transformatie wordt uitgevoerd door  3 programma's:

* Een assembler die je code vertaalt naar assembler (zie later)  
* Een **compiler** die deze assembler vertaalt naar binarie objecten
* Een **linker** die deze binaire objecten linkt tot een uitvoerbaar programma

Dit programma kan dan rechtstreeks geinterpreteerd worden door een CPU

##### Command-line
In de praktijk zijn er programma's die dat voor jou doen.  Voorbeelden van zulke compilers zijn gcc en msc.

![](../pictures/intro_printscreen_of_gcc.png)

Ter illustratie zie je hierboven een voorbeeld van hoe dat je met GCC (via de terminal) een tekstbestand (helloworld.c) transformeert naar een programma (helloworld)

Hoe dat precies in zijn werk gaat wordt in het volgend hoofdstuk uitgelegd.  
Voorlopig kan je er vanuit gaan (indien gcc geinstalleerd is) je dit onder de volgende vorm kan aanroepen:  
```gcc <c-file> -o <programmanaam>```  
om een uitvoerbaar command-line applicatie te verkrijgen.

> Vooraleer te starten met microcontrollers oefenen we de basis van programmeren met c in aan de hand van dit soort programma's dat je van de command-line kan aanroepen.

> Hierover volgt in de volgende hoofdstukken nog zeer veel diepgang, voorlopig focussen we ons op de eerste activiteit, namelijk het schrijven  van code.

### Eerste stap in programmeren

#### Voorbeeld 0: Body van een programma

Hieronder zie je een leeg programma.  
Als je dit programma zou aanroepen zou dit direct beindigen zonder iets te doen.

```
void main ()
{

}
```
Wat moet je hieruit onthouden is:
* Een c-programma start met "void main()"
* Tussen de accolades kan je een sequentie van instructies schrijven.
* Wat er tussen deze acolades staat wordt ook wel de **body** van je programma genoemd.

> Er zijn natuurlijk veel variaties op, maar dat is momenteel nog niet aan de orde.

### Voorbeeld: Output van een programma (deel 1)

Het eerste programma dat altijd wordt gebruikt om een taal te leren kennen is een programma dat een tekst-boodschap afrdukt
Zie ook http://en.wikipedia.org/wiki/List_of_Hello_world_program_examples hoe dit wordt toegepast in zowat alle talen

```
#include <stdio.h>
void main ()
{
  printf("Hello World");
}
```
2 nieuwe elementen kunen we hier onderscheiden:  

```
#include <stdio.h>
```  
Deze lijn duidt eigenlijk aan dat we een voorgedefinieerde bibliotheek met functies willen gebruiken.  
De bibliotheek (of libary) die we hier willen gebruiken bevat een aantal functies die we willen gebruiken voor het lezen van en schrijven naar een scherm.

```
printf("Hello World");
```  



### Voorbeeld: Meerdere statements sequentiel na elkaar

```
#include <stdio.h>
void main ()
{
    printf("Hello world");
    printf(" is een typisch voorbeeld-programma");
}
```
* Een c-programma is een opeenvolging van een aantal statements in dit geval:  
    * ```printf("Hello world")```
    * ```printf(" is een typisch voorbeeld-programma")```
* Elk van deze statements wordt gescheiden door een punt-komma
    * ```;```


### Voorbeeld 2: Variabelen en assignments
```
#include <stdio.h>
int main ()
{
    int getal1 = 5; 	// Geheel getal 1 = 5
    printf("Het getal is: %i",som);
}
```

Variabele is een plekje geheugen waar je een waarde kan opslaan.

Kenmerken van variabelen:  

* Naam: (literal, identifier) volledig vrij te kiezen (betekenisvolle namen gebruiken) Vb. L123, appel, RekeningNummer, ...  
* Waarde: inhoud  
* Type: cijfers, karakters, strings (numerieke en alfanumerieke variabelen)  

> Bemerking:  
een belangrijk kenmerk van een variabele, namelijk geheugen-adres hebben we express niet vermeld.  
We gaan hier de volgende hoofdstukken dieper op in.

### Voorbeeld 3: operatoren en expressies
Belangrijk om met onze variabelen en constanten iets te kunnen doen.
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

------------------------------
TODO voorbeelden te includeren

Variable => plekje in het geheugen dat je kan gebruiken om een waarde op te slaan
  Variable names (and beperkingen + gereserveerde woorden)
  Variabele initialiseren
Expressie => iets dat je kan evalueren en een waarde kan geven
  Wiskundige expressies met operators
  |Operator|Operation|
  |--------|---------|
  |+|optellen|
  |-|aftrekken|
  |*|vermenigvuldigen|
  |/|delen|
  |%|rest|

  Volgorde van uitvoeren (pemal - h-vdr-oa- van links naar rechts)
  Afronden (voorlopig bespreken we enkel ints, later volgen andere)

  !integer division!

  Naming => weten wat code doet

User input en output

Commentaar  


Assignment statement => je will beide koppelen of eventueel rechtsreeks een waarde
Constante is de zelfde



Statement
Assignment statement


  expression
  assignment
  function-calls
  operator

Constant vs variable

------------------------------------------------------------------

## TODO's

Rekenkundige uitdrukkingen worden samengesteld uit constanten/variabelen en wiskundige operatoren:
* ```+```		optelling
* ```-```		aftrekking
* ```*```		vermenigvuldiging
* ```/```		deling
* ```%```		gehele rest van een deling  

Andere bemerkingen:  

##### Haakjes en prioriteit!  
Wanneer met variabelen en constante wordt gewerkt is de normale wiskunde van tel!
Haakjes zijn zeer belangrijk.
A*B+C is niet A*(B+C)

### Ontwikkelen van een programma

1. Probleem definitie
2. Probleem analyse
3. Opstellen algoritme(n)
4. Schrijven van broncode
5. Builden van broncode
6. Testen en debuggen van broncode

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
