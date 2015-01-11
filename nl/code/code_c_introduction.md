## Eerste stappen in programmeren

Als voorbereiding op de labo's, gaan we de elementaire kenmerken van een applciatie verder onder de loep nemen:

* Simple statements
* Variabelen
* Expressies

### Voorbeeld: Body van een programma

De basis-structuur van een C-programma illustreren we aan de hand van een e een leeg programma.  
Als je dit programma zou aanroepen zou dit direct beëindigen zonder iets te doen.

~~~{.c}
void main ()
{

}
~~~

Hoewel dit programma niets doet is het wel een geldig programma dat je kan uitvoeren.
Als je dit programma compileert en vervolgens uitvoert zie je dat dit programma niets afprint

> ```void main(){ }``` is wat we noemen een functie, meer details over functies volgt later.  


~~~
$ gcc empty.c -o empty
$ ls
$ empty.c empty
$ ./empty
$
~~~  


**Wat je echter moet onthouden naar de volgende voorbeelden toe:**

* Een c-programma start met "void main()"
* Tussen de accolades kan je een sequentie van instructies schrijven.
* Wat er tussen deze accolades staat wordt ook wel de **body** van je programma genoemd.

### Voorbeeld: Schrijven naar een console  

Een eerste gewoonte bij het aanleren van programmeer-taal te leren kennen is het schrijven van programma dat een tekst-boodschap afrdukt.
Men noemt dit ook een "Hello World" (zie ook http://en.wikipedia.org/wiki/List_of_Hello_world_program_examples) met voorbeelden voor zowat alle talen.
In C bestaat er een specifieke instructie hiervoor genaamd "printf"

```
#include <stdio.h>
void main ()
{
  printf("Hello World");
}
```
Als je nu dit programma compileert en uitvoert zie je dat het via via een terminal print de boodschap print die we aan deze functie hebben meegegeven.
```
$ gcc helloworld.c -o helloworld
$ ls
$ helloworld helloworld.c
$ ./helloworld
$ Hello World
$
```

Tegenover het vorige programma hebben we **3 nieuwe elementen** kunnen we hier onderscheiden:  

* Het aanroepen van een procedure
* Gebruikt van test (string)
* Importeren van een bibliotheek/library

#### Aanroepen van een procedure  

De eerste instructie die we bekijken is het **aanroepen van een procedure**.  
Een **procedure** zelf - is in essentie - een stuk **herbruikbare** functionaliteit (code).

Die functionaliteit (zoals het printen) kan je dan aanroepen met de volgende syntax  
```
<naam van de procedure>(<argument>,<argument>,...);
```  
Je typt de naam van de procedure, en daarna (tussen de haakjes) een lijst van argumenten (gescheiden met komma's als er meerdere argumenten zijn).

``` {.c}
printf("Hello World");
```  
> Later in deze cursus gaan we procedures nog verder bekijken:
>
> * Beter overzicht van bestaande procedures
> * Procedures (en functies) zelf maken
> * Functies, zijnde procedures die een waarde teruggeven (eigenlijk is printf een functie maar daarover later meer)  
>
> Voorlopig zijn we echter enkel geïnteresseerd in het schrijven van tekst naar de console, we komen hier later op de cursus nog op terug.

#### Gebruik van tekst(string)

We hebben met dit voorbeeld reeds ons eerste data-element gezien dat je in een programma kunt gebruiken, namelijk het data-type string (algemene naam voor tekst in programmeer-talen).  

In C kan je dus een stuk tekst uitdrukken/definiëren met quotes rond (dubbele haakjes)
```
"Deze tekst staat tussen dubbele haakjes"
```
> Net zoals procedures gaan we het concept van Strings gedurende de cursus veel verder onderzoeken.  

#### Importeren van een library (of header-file)
Procedures (en functies) staan dikwijls (in het geval van printf bijvoorbeeld) gegroepeerd in **bibliotheken** (libraries).

De procedure die wij kunnen gebruiken (printf) staat samen met andere procedures (en functies) gedefinieerd in een **header-file**.  
Zo'n header-file kan je beschouwen als de catalogus van deze procedure-file, je krijgt daar een oplijsting van de procedures die je kan gebruiken.

Concreet gezien, om de procedure uit zo'n een bibliotheek te kunnen gebruiken moet je deze header-file aanduiden bij de start van je programma.  
Dit wordt gedaan via de volgende lijn code:
```
#include <stdio.h>
```  
De naam van de header-file staat tussen < en > geplaatst.  
Met deze include of import van deze file zorg je ervoor dat je programma beschikking krijgt tot een serie van procedures (functies) gerelateerd aan io (input/output).

> Deze bibliotheek (of library) is by default voor zien door je omgeving, en moet je niets meer doen dan deze include-statement te voorzien bij de start je programma.  
> Later gaan we andere libraries zien en ook hoe dat je zelf je eigen libraries kan definieren.

### Voorbeeld: Meerdere statements sequentieel na elkaar uitvoeren (meerdere print-statements)
Tot nog toe hadden we enkel 1 instructie doorgegeven, je kan het programma ook **meerdere instructies** na mekaar laten uitvoeren.  
In het programma hieronder, hebben we 2-maal een printf-functie-aanroep geplaatst:

```
#include <stdio.h>
void main ()
{
    printf("Hello world");
    printf(" is een typisch voorbeeld-programma");
}
```
Als je dit programma uitvoert krijg je het volgende resultaat:  

```
$ gcc doublestatement.c -o doublestatement
$ ./doublestatement
Hello World is een typisch voorbeeld programma
$
```
We zien we dat er 2 statements sequentieel na mekaar zijn uit gevoerd en dat de 2 stukken test naar de console worden afgedrukt.

Ter herhaling, de nieuwigheid t.o.v. het vorig  voorbeeld is:

* dat je meerdere statements na elkaar kan uitvoeren  
* deze statements worden van elkaar gescheiden door elk statement te eindigen met een **";"**


### Voorbeeld: Werken met getallen

We hadden reeds een eerste **datatype** bekeken tot nog toe, namelijk **string** (tekst).  
C ondersteunt echter **veel meer datatypes**, 1 van deze datatypes is een **integer**.

Een getal in C - in het voorbeeld hieronder een extra argument aan printf - wordt uitgedrukt door gewoon het getal te typen.  
In tegenstelling tot een string moet je hier **geen quotes** rond plaatsen.

```
#include <stdio.h>
void main ()
{
    printf("Het getal is: %i\n",5);
}
```

In het voorbeeld hierboven voegen we 2 nieuwe zaken toe:

* Een integer/getal meegeven als aan printf  
* Het gebruik van placeholders aan printf  

De functie printf kan niet rechtstreeks getallen afdrukken.  
Daarvoor bestaat er specifieke syntax, je kan namelijk binnen het eerste (string-)argument de plek waar je het getal wil printen met %i markeren.  
De functie printf zal deze dan deze placeholder (%i) vervangen door het getal bij het afdrukken.

```
$ gcc printnumber.c -o printnumber
$ ./printnumber
$ Het getal is: 5
```

Dit lijkt vrij overbodig want ```printf("Het getal is: 5");``` geeft hetzelfde formaat.  
Bij het volgende begrip "variabelen" gaat het nut hiervan duidelijker worden.

### Voorbeeld: Variabelen en data-types  

De C-programmeertaal laat je ook toe van - tijdens het uitvoeren van je programma - bepaalde waardes bij te houden in het geheugen.

```
#include <stdio.h>
int main ()
{
    int getal = 5; 	// Geheel getal 1 = 5
    printf("Het getal is: %i",getal);
    printf("Nog 1 maal printen van %i",getal);
}
```

Een variabele is een plekje geheugen waar je een waarde (in dit geval 5) kan opslaan en een naam kan toekennen (in dit geval getal).

Kenmerken van variabelen:  

* Naam: (literal, identifier) volledig vrij te kiezen (betekenisvolle namen gebruiken) Vb. L123, appel, RekeningNummer, ...  
* Waarde: inhoud  
* Type: cijfers, karakters, strings (numerieke en alfanumerieke variabelen)  

> Bemerking:  
een belangrijk kenmerk van een variabele, namelijk geheugen-adres hebben we express niet vermeld.  
We gaan hier de volgende hoofdstukken dieper op in.

### Voorbeeld: operatoren en expressies
Belangrijk om met onze variabelen en constanten iets te kunnen doen.
```
#include <stdio.h>
void main ()
{
    int getal1 = 5; 	// Geheel getal 1 = 5
    int getal2 = 7;	// Geheel getal 2 = 7
    int som = getal1 + getal2;
    printf("Het resultaat is: %i",som);
}
```

##### Overzicht operatoren

| Operator | Operatie         |
|:---------|:-----------------|
| +        | optellen         |
| -        | aftrekken        |
| *        | vermenigvuldigen |
| /        | delen            |
| %        | rest             |


### Voorbeeld precedence

### Voorbeeld: printf met meerdere placeholders

------------------------------
TODO voorbeelden te includeren

Variable => plekje in het geheugen dat je kan gebruiken om een waarde op te slaan
  Variable names (and beperkingen + gereserveerde woorden)
  Variabele initialiseren
Expressie => iets dat je kan evalueren en een waarde kan geven
  Wiskundige expressies met operators


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
