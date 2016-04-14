## Arrays

### Introductie: wat is een array

Tot nu toe hebben we variabelen gebruikt (gedeclareerd en geïnitialiseerd) die slecht 1 waarde kunnen bevatten.  
Deze benoemen we als simpele (of enkelvoudige datatypes).

C voorzien echter ook in complexe (of samengstelde) datatypes.  
Een eerste van deze types zijn arrays (heel soms ook geïndexeerde variabele genoemd).  

Praktisch uitgedrukt **arrays** zijn:

* Een **verzameling** of collectie van elementen van bepaald **type**  
  (zoals we eerder int, short, char, ... hebben gezien).
* Elk **element** van zo'n array worden **gelezen of gewijzigd** via een **index**
* Een array heeft een **grootte of dimensie** (die we voor de gemakkelijkheid aanduiden als n)
* Deze index **start** bij **0** (1ste element) en **eindigt** bij de index **n-1***
* De **dimensie** van een array-variabele kan niet wijzigen tijdens de loop van het programma  
  Deze is zelfs vastgesteld bij **compilatie**  

> **Nota:**    
> Later gaan we zien dat de laatste bemerking niet volledig waar is als we spreken over dynamisch geheugen en heaps.

### Voorbeeld: declareren, initialiseren en gebruiken van een array

Dit was de theoritische verklaring, laten we verklaren met een voorbeeld.  
Het voorbeeld hieronder declareert zo'n array en print elk **element** van deze array af.  

```c
#include <stdio.h>

int main(void)
{
    unsigned char een_array[2];
    een_array[0]=1;
    een_array[1]=2;

    printf("een_array[0]=%hhu\n",een_array[0]);
    printf("een_array[1]=%hhu\n",een_array[1]);

    return 0;
}
```

In dit voorbeeld:

* **Declareren** we een array met als **dimensie 2**
* We **initialiseren** elk element aan de hand van de index
* We **lezen** ook op dezelfde manier de waardes uit deze array uit

Het resultaat is zoals verwacht:

```
$ gcc array_voorbeeld.c -o array_voorbeeld
$ ./array_voorbeeld
een_array[0]=1
een_array[1]=2
$
```

### Duiding: syntax om een array declareren

De declaratie van een array gaat dus als volgt:

```c
type naam[grootte];
```
Belangrijk te bemerken is dat deze array eender welk type kan zijn (zelfs een array)

### Duiding: initialisatie

Initialisatie van een individueel element (of initialiseren) kan je doen door de index tussen vierkante haken te zetten:

```c
naam[index]=waarde;
```

### Duiding: syntax om een array declareren en initialiseren

Je kan deze ook (optioneel) **initialiseren tijdens de declaratie** als volgt:

```c
type naam[grootte]={waarde_1,waarde_2,...,waarde_n};
```
We zullen dit illustreren met enkele voorbeelden

### Voorbeeld: declaratie en initialisatie tegelijk

```c
#include <stdio.h>

int main(void)
{
    unsigned char een_array[2]={0,1};

    printf("een_array[0]=%hhu\n",een_array[0]);
    printf("een_array[1]=%hhu\n",een_array[1]);

    return 0;
}
```

Dit geeft het hezelfde resultaat als vorig voorbeeld.

### Voorbeeld: dimensie is optioneel bij gelijktijdige declaratie en initialisatie

Als je een waarde initialiseert bij declaratie kan de compiler zelf afleiden hoe groot dat de array is

```c
#include <stdio.h>

int main(void)
{
    unsigned char een_array[]={0,1};

    printf("een_array[0]=%hhu\n",een_array[0]);
    printf("een_array[1]=%hhu\n",een_array[1]);

    return 0;
}
```
Het resultaat is identiek aan vorig voorbeeld.

### Voorbeeld: gebruik van sizeof bij arrays

Net zoals bij gewone variabelen kan je de grootte van zo'n array opmeten met de sizeof-operator.

```c
#include <stdio.h>

int main(void)
{
    unsigned char char_array[3];
    unsigned short short_array[3];

    printf("Grootte van char-array van %i elementen is %zu\n",3,sizeof(char_array));
    printf("Grootte van short-array van %i elementen is %zu\n",3,sizeof(short_array));

    return 0;
}
```

De sizeof-operator zal:

* De **grootte** van de arrays **in bytes** geven
* Deze wordt uitgedrukt in **size_t**
* size_of = (dimensie array) * (precisie type)

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

```c
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

### Opletten: een niet geinitialiseerde array

Een array waarvan de elementen niet zijn geinitialiseerd zal rommel bevatten (garbage)

```c
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

```c
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

```c
#include <stdio.h>

int main()
{
    unsigned char een_array[3]={};

    int teller = 0;
    while(teller<sizeof(een_array)/sizeof(unsigned char)) {
        printf("Index %i heeft waarde %hhu \n",teller,een_array[teller]);
        teller++;
    }

    return 0;
}
```

Met als resultaat:

```
$ gcc arrayall0_voorbeeld.c -o arrayall0_voorbeeld_voorbeeld
$ ./arrayall0_voorbeeld
Index 0 heeft waarde 0
Index 1 heeft waarde 0
Index 2 heeft waarde 0
```

### Duiding: een array bestaat uit aangesloten geheugen-locaties

Een andere manier van te bekijken is dat een array, een array is een manier om een stuk geheugen te reserveren ter grootte van ```n * s``` waar:

* n (number) het **aantal elementen** in deze array bevat (of de dimensie)
* s (size) de **groott0**e van deze elementen (bepaalt door het type van deze array)  

Net zoals bij een gewone variabelen zal elk element van de array zijn geheugencellen adresseren

![](../../pictures/arrays_in_memory.png)

In bovenstaande illustratie:

* van het type **unsigned char** (s=1 byte)  
  met een **dimensie van 8** (n=2)  
  zou deze array ```8 * 1 = 2``` bytes geheugen innemen (opeenvolgend).  
* van het type **unsigned short** (s=2 bytes)   
  met een **dimensie van 5** (n=5)
  zou deze array ```5 * 2 = 10``` bytes geheugen innemen (opeenvolgend).

Let wel elke element zal (net zoals bij enkelvoudige integers) een endiannes hebben.  
Gezien we in deze cursus enkel met x86 en AVR werken zal die little endian zijn.  

**Let wel:**  
De waarde die geencodeerd is op adres 0x0AB0 (gereferenceerd door 0x0AB0) heeft dus in werkelijkheid de waarde 0xAABB  
(en niet 0xBBAA zoals je op het eerste zicht zou kunnen vermoeden)

### Voorbeeld: printen van geheugen-adressen op een array

Stel bijvoorbeeld:

* Een array met een dimensie van 3
* Op basis uit een type van bijvoorbeeld 2 bytes
* Het adress van deze array is bijvoorbeeld ```0xA0```

Dit zou inhouden dat:

* Het eerste element op ```0xA0``` zou zitten
* Het 2de op ```0xA2 (0xA + (1 * 2))```
* Het 2de op ```0xA4 (0xA + (2 * 2))```

Dit wordt geillustreerd door het volgende programma:

```c
#include <stdio.h>

int main(void) {
    unsigned char char_array[3];
    unsigned short short_array[3];
    int teller=0;

    printf("Grootte van char-array van %i elementen is %zu\n",3,sizeof(char_array));

    while(teller<(sizeof(char_array)/sizeof(unsigned char))) {
        printf("Index %i heeft adres %p \n",teller,&char_array[teller]);
        teller++;
    }

    printf("\n");
    printf("Grootte van short-array van %i elementen is %zu\n",3,(sizeof(short_array)/sizeof(unsigned short)));
    teller=0;
    while(teller<(sizeof(short_array)/sizeof(unsigned short))) {
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

### Opletten: boundaries van een array

Zoals we reeds hebben gezien in vorig voobeeld, arrays worden in het geheugen als een aan elkaar gesloten rij opgeslagen.  
Een array met dimensie 10 en type unsigned char is opgeslagen als 10 na elkaar geplaatste unsigned char's.  

Er wordt alleen een referentie bijgehouden naar het eerste element, de andere elementen worden gevonden door adresberekening.
Er is geen controle op de grenzen (bounds) van een array, te grote indexen overschrijven geheugen dat niet voor de array was bestemd = VIEZE FOUTEN!

Als je een element van een array gaat proberen te lezen of schrijven zal deze:

* In het slechtse geval niets doen en een andere waarde uit het geheugen overschrijven.  
  Dit kan onverwachte fouten voor je programma.
* In het beste geval zal het programma eindigen (op zijn minst ga je weten dat er een fout is in je programma)  
  In de meeste operating systemen is hier wel een beveiliging op ingebouwd die je programma gaat stoppen maar dat is niet altijd een garantie.  
