## Geheugen, pointers and arrays

### Herhaling: geheugen van een computer (memory-organisatie)

Zoals we reeds eerder hebben gezien wordt het werk-geheugen van een computer:

* Opgedeeld in geheugen-locaties van **1 byte** groot
* Elk van deze adressen is **adresseerbaar**
* Deze adressen volgen elkaar op zoals in het onderstaand voorbeeld
* Je kan dit het gemakkelijkst bekijken als een **lange rij** van geheugencellen van 1 byte lang

| **adres**        |  **inhoud**     |
|------------------|-----------------|
| ```0X0000```     |  ```0XAA```     |
| ```0X0001```     |  ```0X00```     |
| ```0X0002```     |  ```0XAA```     |
| ```0X0003```     |  ```0X00```     |
| ...              |  ...            |


Bovenstaande tabel is een voorbeeld van een 16-bit geheugen (zoals het datageheugen van een AVR Atmega).  
De 16 bit van zo'n geheugen staat er voor dat er 2^16 (65536) verschillende geheugen-cellen beschikbaar zijn.

### Herhaling: Variabelen en geheugen

Zeer kort samengevat, tot nog toe hebben we rond variabelen gezien:

* Deze variabelen hadden een **type**
* We hebben ons (tot nog toe) beperkt tot **integer-types**
* We hebben ons (in het bit-mask-hoofdstuk) beperkt tot **unsigned** integer-types
* Elk van deze types hebben verschillende **grootte** (of dimensies)
* De c-standaard verplicht c-compilers (en platformen) een **minimum grootte** te respecteren
* De c-compilers zijn in principe vij van boven deze minima te gaan 

|type                  |minimum           | x86               | 
|----------------------|------------------|-------------------|
| unsigned char        | 1                | 1                 |
| unsigned short       | 2                | 2                 |
| unsigned int         | 2                | 4                 |
| unsigned long        | 4                | 4                 |
| unsigned long long   | 8                | 8                 |

> **Nota:**  
> De types die we hieronder zijn in volgorde.  
> De C-specificatie vermeldt enkel het minimum maar deze volgorde moet wel blijven gerespecteerd.  
> Bijvoorbeeld een unsigned int mag op bepaalde platformen 8 bytes lang zijn, maar dan moet een unsigned long minimum 8 bytes zijn. 

De meeste van deze types (met uitzondering van een unsigned char) zijn groter dan een byte.
Belangrijk te weten (voor de komende onderwerken) is dat c-compilers er voor zorgen dat deze bytes achter elkaar worden geplaatst.  

### Voorbeeld: Casten van waardes?

Je kan waarden overdragen tussen variabelen van verschillende types.  
We noemen dit casting en zijn 2 varianten (niet meerekenende overdracht tussen 2 variabelen van hetzelfde type):

* **promotie**  
  Je **initialiseert** een variabele van een bepaald type met de waarde van die van een **kleiner type**.  
  Dit geeft geen problemen, je verliest geen data.  
* **degradatie**  
  Je **initialiseert** een variabele van een bepaald type met de waarde van een variabele met een **groter type**.  
  In dit geval kan je data verliezen, de meest significante bytes zullen verloren gaan.  
  Stel dat je de variabelen van 1 byte probeert te initialiseren vanuit een 8 byte variabele zal je de 7 MSB-bytes kwijtgeraken.  
  maw als je een waarde groter dan 255 ingeeft zal je data kwijt geraken zoals in onderstaand voorbeeld

```{.c}
#include <stdio.h>

int main(void) {
    unsigned int groter_getal=0xFFFF;
    printf("groter getal: %x\n",groter_getal);

    unsigned int nog_groter_getal=(unsigned int)groter_getal;
    printf("nog groter getal: %x\n",nog_groter_getal);


    unsigned char kleiner_getal=(unsigned char)groter_getal;
    printf("kleiner getal: %x",kleiner_getal);
    return 0;
}
```

In de code zie je dat je het type meegeeft tussen haakjes naar waartoe je wil casten (of converteren).  

Men noemt dit **expliciet casten**, je laat de compiler weten dat je naar dit type will converteren.  
Dit is niet verplicht maar wel belangrijk als je een degradatie toepast anders zal de compiler warnings genereren.  

```
$ gcc casting_voorbeeld.c -o casting_voorbeeld
$ ./casting_voorbeeld
groter getal: aabb
nog groter getal: aabb
kleiner getal: bb
```

Als resultaat zie je dat de waarde in het kleiner getal als het ware wordt afgeknipt.  
Enkel bb blijft behouden, de boodschap is hier dat je voorzichtig moet zijn met conversies tussen types.

> **Nota:**  
> We komen hier later nog op terug als we bij signed integers en floating-point getallen gaan bekijken.


### Voorbeeld: sizeof

In C kan je de werkelijk grootte (of dimensie) van zo'n type opvragen via de **operator sizeof** (geen functie!!).  
Deze operator zal dan een waarde teruggeven van het type **size_t**, dit is een type specifiek voorzien voor het uitdrukken van dimensies van types en variabelen die elke C-compiler moet voorzien.  

```{.c}
#include <stdio.h>
#include <stddef.h>

int main(void) {

    unsigned int getal = 5;
    printf("%zu\n",sizeof(getal));
    printf("%zu\n",sizeof(int));

    size_t register_grootte = sizeof(size_t);
    printf("%zu\n",register_grootte);
    return 0;
}
```

Bovenstaand voorbeeld illustreert het gebruik van deze sizeof-operator:

* Je kan deze toepassen op **zowel variabelen als types** (een eender welke expressie)
* Je kan deze waarde opvangen in een variabele van het type **size_t**
* De definitie van dit type kan je vinden in de header-file **stddef.h** 

Het resultaat hiervan uitgevoerd (en gecompileerd) op een 64-bit-processor (gcc

```
$ lscpu | grep Architecture
Architecture:          x86_64
$ gcc --version
gcc (Ubuntu 4.9.1-16ubuntu6) 4.9.1
Copyright (C) 2014 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
$ gcc sizeof_voorbeeld.c -o sizeof_voorbeeld
$ ./sizeof_voorbeeld
4
4
8
$
```

De grootte van deze size_t hangt af van platform en compiler, dit in de meeste gevallen overeen met de adres-dimensies van een platform.  
In het voorbeeld hierboven is dit gecompileerd en uitgevoerd op een 64-bit machine en zie je dat size_t 8 bytes lang is (hetgeen overeenstemt met 64 bits).  

### Voorbeeld: afdrukken van het geheugen-adres

In c is er ook een manier om deze **adressen** te zien.  
Men kan de **locatie in het werk-geheugen** bekomen door de naam van de variabele te prefixen met een **&-symbool**.  
Om de waarde van dit adres af te drukken dien je de placeholder **p** te gebruiken (zoals we i gebruiken voor integers en uhh voor unsigned chars).  

```{.c}
#include <stdio.h>

int main(void) {
    unsigned char test=2;
    printf("Waarde van test: %uhh\n", test);
    printf("Adres van test: %p\n", &test);
    return 0;
}
```
Code: 

* We extraheren het adres door **&** te plaatsen voor de variabele-naam test
* Om dit af te drukken moet je de placeholder **p** gebruiken

```
$ gcc geheugenadress_voorbeeld.c -o geheugenadress_voorbeeld
$ ./geheugenadress_voorbeeld
Waarde van test: 2hh
Adres van test: 0x7ffd772e33e7
```

Om de de waarde van dit adres op te vangen in een variabele is er ook een specifiek type voorzien (zoals we eerder hebben gezien voor size_t).  
Hier komen we later nog op terug als we bij het onderwerp pointers komen.

Voorlopig hebben we deze operator (&) nodig om in onze voorbeelden adressen af te drukken in ons volgend voorbeeld, namelijk om het concept van  **arrays te verduikelijken.  

### Introductie: wat is een array

Tot nu toe hebben we variabelen gebruik (gedeclareerd en geïnitialiseerd).  
Deze benoemen we als simpele (of enkelvoudige datatypes).

C voorzien echter ook in complexe (of samengstelde) datatypes.  
Een eerste van deze types zijn arrays (heel soms ook geïndexeerde variabele genoemd).  

Heel simpel uitgedrukt zijn arrays:

* Een **verzameling** of collectie van **simpele types**.
* Elk **element** van zo'n array worden **gelezen of gewijzigd** via een index
* Een array heeft een **grootte of dimensie** (die we voor de gemakkelijkheid aanduiden als n)
* Deze index **start** bij **0** (1ste element) en **eindigt** bij de index **n-1***
* De **dimensie** van een array-variabele kan niet wijzigen tijdens de loop van het programma  
  Deze is zelfs vastgesteld bij **compilatie**  

> **Nota:**    
> Later gaan we zien dat de laatste bemerking niet volledig waar is als we spreken over dynamisch geheugen en heaps. 

### Duiding een array declareren en initialiseren

De declaratie van een array gaat als volgt:

```{.c}
type naam[grootte];
```
Belangrijk te bemerken is dat deze array eender welk type kan zijn (zelfs een array)

Je kan deze ook (optioneel) initialiseren tijdens de declaratie als volgt:

```{.c}
type naam[grootte]={waarde_1,waarde_2,...,waarde_n};
```

Assignen van een individueel element (of initialiseren) kan je doen door de index tussen vierkante haken te zetten:

```{.c}
naam[index]=waarde;
```

We zullen dit illustreren met enkele voorbeelden

### Voorbeeld: initialiseren en gebruiken van een array

```{.c}
#include <stdio.h>

int main(void) {
    unsigned char een_array[2];
    een_array[0]=1;
    een_array[1]=2;

    printf("een_array[0]=%hhu\n",een_array[0]);
    printf("een_array[1]=%hhu\n",een_array[1]);

    return 0;
}
```

In dit voorbeeld:

* Declareren we een array met als dimensie 2
* We initialiseren elk van deze elementen aan de hand van de index
* We lezen ook op dezelfde manier de waardes uit deze array uit

Het resultaat is zoals verwacht:

```
$ gcc array_voorbeeld.c -o array_voorbeeld
$ ./array_voorbeeld
een_array[0]=1
een_array[1]=2
$
```

### Voorbeeld: declaratie en initialisatie tegelijk

Je kan ook een array initialiseren tijdens de declaratie.

```{.c}
#include <stdio.h>

int main(void) {
    unsigned char een_array[2]={0,1};

    printf("een_array[0]=%hhu\n",een_array[0]);
    printf("een_array[1]=%hhu\n",een_array[1]);

    return 0;
}
```

Dit geeft het hezelfde resultaat als vorig voorbeeld.

### Voorbeeld: dimensie is optioneel bij gelijktijdige declaratie en initialisatie

Als je een waarde initialiseert bij declaratie kan de compiler zelf afleiden hoe groot dat de array is 

```{.c}
#include <stdio.h>

int main(void) {
    unsigned char een_array[]={0,1};

    printf("een_array[0]=%hhu\n",een_array[0]);
    printf("een_array[1]=%hhu\n",een_array[1]);

    return 0;
}
```

Het resultaat is identiek aan vorig voorbeeld.

### Voorbeeld: gebruik van sizeof bij arrays

Net zoals bij gewone variabelen kan je de grootte van zo'n array opmeten met de sizeof-operator.

```{.c}
#include <stdio.h>

int main(void) {
    unsigned char char_array[3];
    unsigned short short_array[3];

    printf("Grootte van char-array van %i elementen is %zu\n",3,sizeof(char_array));
    printf("Grootte van short-array van %i elementen is %zu\n",3,sizeof(short_array));

    return 0;
}
```

De sizeof-operator zal: 

* De grootte van de arrays in bytes geven
* Deze wordt uitgedrukt in size_t
* De grootte wordt bepaald door het aantal bytes voor een gegeven type te vermenigvuldigen met de dimensie van de array 

```
$ gcc sizeofarray_voorbeeld.c -o sizeofarray_voorbeeld
$ ./sizeofarray_voorbeeld
Grootte van char-array van 3 elementen is 3
Grootte van short-array van 3 elementen is 6
$
```

In dit voorbeeld zien we dat:

* De char-array ```3 * 1 = 3``` bytes groot is (char is 1 byte)
* De short-array ```3 * 2 = 6``` bytes groot is (short is 2 bytes)

### Voorbeeld: loopen door een array

Arrays worden in praktijk zeer veel gebruikt in combinatie met een loop.  
Volgend voorbeeld gebruikt een teller-variabele om telkens het volgende element te gebruiken. 

```{.c}
#include <stdio.h>

int main()
{
    unsigned char een_array[3]={1,2,3};

    int teller = 0;
    while(teller<sizeof(een_array)) {
        printf("Index %i heeft waarde %hhu \n",teller,een_array[teller]);
        teller++;
    }

    return 0;
}
```
Als resultaat gaat hij de individuele elementen van de array afprinten.

```
$ gcc loopingarray_voorbeeld.c -o loopingarray_voorbeeld
$ ./loopingarray_voorbeeld
Index 0 heeft waarde 1 
Index 1 heeft waarde 2 
Index 2 heeft waarde 3 
```

In de praktijk noemt men dit ook **een array iterreren**

### Voorbeeld: een niet geinitialiseerde array

Een array waarvan de elementen niet zijn geinitialiseerd zal rommel bevatten (garbage)

```{.c}
#include <stdio.h>

int main()
{
    unsigned char een_array[3];

    int teller = 0;
    while(teller<sizeof(een_array)) {
        printf("Index %i heeft waarde %hhu \n",teller,een_array[teller]);
        teller++;
    }

    return 0;
}
```

Als resultaat zal je arbitraire waardes verkrijgen (rommmel)

```
$ gcc noninit_voorbeeld.c -o noninit_voorbeeld
$ ./noninit_voorbeeld_voorbeeld
Index 0 heeft waarde 16 
Index 1 heeft waarde 46 
Index 2 heeft waarde 66 
```


### Voorbeeld: een gedeeltelijk geinitialiseerde array

Een array kan je ook gedeeltelijk initialiseren

```{.c}
#include <stdio.h>

int main()
{
    unsigned char een_array[3]={1};

    int teller = 0;
    while(teller<sizeof(een_array)) {
        printf("Index %i heeft waarde %hhu \n",teller,een_array[teller]);
        teller++;
    }

    return 0;
}
```

Deze initialisatie zal er voor zorgen:

* Dat het eerste element op 1 wordt gezet
* De andere element (index 1 en 2) worden op 0 gezet

```
$ gcc partialinit_voorbeeld.c -o partialinit_voorbeeld
$ ./partialinit_voorbeeld
Index 0 heeft waarde 1 
Index 1 heeft waarde 0 
Index 2 heeft waarde 0 
```

### Voorbeeld: een array initialiseren met 0

Dit kan ook een manier zijn om alle waardes op 0 te initialiseren bij declaraite

```{.c}
#include <stdio.h>

int main()
{
    unsigned char een_array[3]={};

    int teller = 0;
    while(teller<sizeof(een_array)) {
        printf("Index %i heeft waarde %hhu \n",teller,een_array[teller]);
        teller++;
    }

    return 0;
}
```

Zoals je zien
 
```
$ gcc arrayall0_voorbeeld.c -o arrayall0_voorbeeld_voorbeeld
$ ./arrayall0_voorbeeld
Index 0 heeft waarde 0 
Index 1 heeft waarde 0 
Index 2 heeft waarde 0 
```

### Illustratie: een array bestaat uit aangesloten geheugen-locaties

Zoals eerder vermeld bestaat een array uit opeenvolgende geheugen-cellen.  
Stel bijvoorbeeld:

* Een array met een dimensie van 3
* Op basis uit een type van bijvoorbeeld 2 bytes
* Het adress van deze array is bijvoorbeeld ```0xA0```

Dit zou inhouden dat:

* Het eerste element op ```0xA0``` zou zitten
* Het 2de op ```0xA2 (0xA + (1 * 2))```
* Het 2de op ```0xA4 (0xA + (2 * 2))```

Dit wordt geillustreerd door het volgende programma:

```{.c}
#include <stdio.h>

int main(void) {
    unsigned char char_array[3];
    unsigned short short_array[3];
    int teller=0;

    printf("Grootte van char-array van %i elementen is %zu\n",3,sizeof(char_array));

    while(teller<sizeof(char_array)) {
        printf("Index %i heeft adres %p \n",teller,&char_array[teller]);
        teller++;
    }

    printf("\n");
    printf("Grootte van short-array van %i elementen is %zu\n",3,sizeof(short_array));
    teller=0;
    while(teller<sizeof(short_array)) {
        printf("Index %i heeft waarde %p \n",teller,&short_array[teller]);
        teller++;
    }

    return 0;
}
```

Dit programma zal het volgend afprinten:

```
$ gcc arrayadress_voorbeeld.c -o arrayadress_voorbeeld_voorbeeld
$ ./arrayadress_voorbeeld
Grootte van char-array van 3 elementen is 3
Index 0 heeft adres 0x7fffea7cf490 
Index 1 heeft adres 0x7fffea7cf491 
Index 2 heeft adres 0x7fffea7cf492 

Grootte van short-array van 3 elementen is 6
Index 0 heeft waarde 0x7fffea7cf480 
Index 1 heeft waarde 0x7fffea7cf482 
Index 2 heeft waarde 0x7fffea7cf484 
Index 3 heeft waarde 0x7fffea7cf486 
Index 4 heeft waarde 0x7fffea7cf488 
Index 5 heeft waarde 0x7fffea7cf48a 
```

### Waarschuwing: boundaries van een array

Zoals we reeds hebben gezien in vorig voobeeld, arrays worden in het geheugen als een aan elkaar gesloten rij opgeslagen.  
Een array met dimensie 10 en type unsigned char is opgeslagen als 10 na elkaar geplaatste unsigned char's.  

Er wordt alleen een referentie bijgehouden naar het eerste element, de andere elementen worden gevonden door adresberekening.
Er is geen controle op de grenzen (bounds) van een array, te grote indexen overschrijven geheugen dat niet voor de array was bestemd = VIEZE FOUTEN!

Als je een element van een array gaat proberen te lezen of schrijven zal deze:

* In het slechtse geval niets doen en een andere waarde uit het geheugen overschrijven.  
  Dit kan onverwachte fouten voor je programma.
* In het beste geval zal het programma eindigen (op zijn minst ga je weten dat er een fout is in je programma)  
  In de meeste operating systemen is hier wel een beveiliging op ingebouwd die je programma gaat stoppen maar dat is niet altijd een garantie.  











