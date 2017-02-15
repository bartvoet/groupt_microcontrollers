## Werken met bitmasks

De vraag die nu overblijft, waarvoor kan je dit nu allemaal gebruiken?
Als je software schrijft voor een MCU werkt of specifieke low-level-software zoals bijvoorbeeld drivers moet je geregeld bits op een memory-locatie manipuleren.

Je gaat als het ware integers niet meer bekijken als getallen waar je wiskundige bewerkingen met uitvoert, je gaat ze bekijken als stukjes memory, aaneenschakelingen van bits.

Om dit efficiënt toe te passen gaan we beide operatoren - bitwise- en shiftoperatoren - combineren naar een bitmask.  
Zo'n **bitmask** kan je best bekijken als een **bit-patroon** (of masker) dat je over een **integer-variabele** legt om:

* Te weten te komen wat de **waarde** is van een bit op een **specifieke locatie**
* Een specifieke bit (of meerdere tegelijkertijd) te **setten** (op 1 zetten)
* Een specifieke bit (of meerdere tegelijkertijd) te **clearen** (op 0 zetten)
* Een specifieke bit (of meerdere tegelijkertijd) te **togglen** of alterneren
* Of eender welke **combinatie** van de 4 voorgaande mogelijkheden  

De eerste die we bekijken is het uitlezen van een bit of een specifieke locatie.

### Voorbeeld: Een bit-query met and (bit op specifiek positie lezen)

Je wil weten of een specifieke bit is geactiveerd?
Dit kan je doen door 2 operatoren te combineren, namelijk & en <<.

* Met ```1 << x``` kan je een bit-patroon maken dat enkel een 1 bevat op positie x
* Met & zorg je ervoor dat alle bits die je niet interesseren in het resultaat op 0 staan
 (eigenschap van & is dat 0 dominant is)
* De bit (positie) die je wel interesseert wordt dan vergeleken met een bit 1 (komende van bitmask)

Voorbeeld:

* Stel als je wil weten dat er op positie 2 (van LSB-zijde te beginnen) een bit op 1 staat  
* Je maakt het patroon of masker (0000 0100) waar enkel op positie 2 een 1 staat
* Je kan hiervoor de expressie ```1 << 2``` gebruiken
* Het resultaat zal uit allemaal 0-bits bestaan met uitzondering van positie 2
* Als je nu &-de operator gebruikt op een getal en het makser zal het resultaat afhangen van het gegeven getal:
     * Staat er op die positie een bit 1 dan hebben we een resultaat <> 0 (true)
     * Staat er op die positie een bit 0 dan hebben we een resultaat == 0 (false)
* Deze expressie kan je dan bijvoorbeeld gebruiken in een conditie (if), loop (while), ...

Beschouw de volgende code:

```c
#include <stdio.h>

int main()
{
    int test_getal= 0x5;

    if(test_getal & (1 << 2)) {
        printf("bit %i van testgetal %x is gezet\n",2,test_getal);
    } else {
        printf("bit %i van testgetal %x is niet gezet\n",2,test_getal);
    }

    if(test_getal & (1 << 5)) {
        printf("bit %i van testgetal %x is gezet\n",5,test_getal);
    } else {
        printf("bit %i van testgetal %x is niet gezet\n",5,test_getal);
    }
}
```

Volgende tabel illustreert wat er zich afspeelt in de eerste if-statement:

|                         | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|-------------------------|---|---|---|---|---|---|---|---|
| test_getal = 5          | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 |
| 1 << 2                  | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| **&**                   | & | & | & | & | & | & | & | & |
| 5 & (1 << 2)            | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |

Het 1ste if-statement zal in een byte resulteren met zeker 1 bit op 1, binnen een if-statement wordt een getal <> 0 als een logische TRUE beschouwd.

Je maakt gebruik maakt van het principe dat een **0 dominant** is bij een **&** operator:

* Overal buiten positie 2 is de bit 0, dus gegarandeerd zal dit 0 als resultaat voortbrengen
* Waar de bitmask 1 is (positie 2) zal de & zich gedragen als een buffer gate (behoudt de waarde van de bit)

Het 2de if-statement echter zal in een 0 resulteren (en binnen een if geldt dit als false)

|                         | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|-------------------------|---|---|---|---|---|---|---|---|
| test_getal = 5          | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 |
| 1 << 5                  | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| **&**                   | & | & | & | & | & | & | & | & |
| 5 & (1 << 5)            | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |


> **Nota:**  
> Je gebruikt als het ware de 2 soorten operatoren om patronen toe te passen op integers of memory-locaties.
> Het manipuleren van individuele bits in het geheugen is 1 van de belangrijke vaardigheden voor embedded programmeren (zoals we weldra gaan zien)

> **Nota:**  
> Denk terug (of herlees) de vorige les waar we de eigenschap van een if-statement bekeken (zal enkel uitvoeren wanneer de expressie <> 0)

### Voorbeeld: een samengestelde bitmask

We hebben dit nu toegepast om 1 enkele bit te selecteren.
Je kan ook grotere bitmask maken, stel voor dat je wil weten dat minstens 1 positie is  
```c
#include <stdio.h>

int main()
{
    int test_getal= 0xAA;

    if(test_getal &  (1 << 3) | (1 << 6) {
        printf("bit %i van testgetal %x is gezet\n",2,test_getal);
    } else {
        printf("bit %i van testgetal %x is niet gezet\n",2,test_getal);
    }
    return 0;
}
```

|                           | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|---------------------------|---|---|---|---|---|---|---|---|
| test_getal = 0xAA         | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
| (1 << 3)  &#124; (1 << 6) | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 |
| **&**                     | & | & | & | & | & | & | & | & |
| 5 & (1 << 2)              | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |

### Voorbeeld: printen welk bits zijn gezet

Een praktisch voorbeeld is als je wil uitprinten welke bits van een getal op 1 staan

```c
#include <stdio.h>

int main()
{
   unsigned char test_getal;
     int i=0;

     printf("Geef een getal in: ");
     scanf("%hhu",&test_getal);

     while(i < (sizeof(test_getal) * 8)) {
         if(test_getal & 1 << i) {
            printf("bit %i van testgetal %x is gezet\n",i,test_getal);
         }
    i++;
    }
    return 0;
}
```
### Voorbeeld: een bitmask toepassen op byte-niveau

Als voorbeeld, stel het volgende:

* Een unsigned short heeft 16 bits
* Je wil deze opsplitsen in 2 chars
    * 1 met de MSB byte
    * 1 met de LSB byte

```c
#include <stdio.h>

int main()
{
   unsigned short big_number = 0xAABB;
   unsigned char ls_byte = big_number & 0x00ff;
   unsigned char ms_byte = (big_number & 0xff00) >> 8;

   printf("ms byte of number %x is %x\n",big_number,ms_byte);
   printf("ls byte of number %x is %x\n",big_number,ls_byte);
}
```

Als je dit programma uitvoert :

```
$ ./bitmask_op_byteniveau
ms byte of number aabb is aa
ls byte of number aabb is bb
```

Bovenstaande code combineert in dit geval de 2 bit- en shift-operatoren:

* Voor de ls_byte is dit vrij eenvoudig:  
```
__0000000011111111  00ff
& 1010101010111011  aabb
__0000000010111011  00bb
```
* Voor de ms_byte zijn er 2 stappen nodig:  
```
__1111111100000000  ff00
& 1010101010111011  aabb
__1010101000000000  aa00
>> 8
__0000000010101010  00aa
```

### Voorbeeld: bits setten met or (wijzigen naar 1)

Tot nu toe hadden we enkel geprobeerd de waarde op een specifieke positie te weten te komen.  
Je kan ook een bit (op een specifieke positie) in een getal wijzigen zonder de andere bits van dit getal te wijzigen.
Dit is een vaardigheid dat je zeer veel nodig zal hebben voor een MCU-programma.  


```c
#include <stdio.h>

int main()
{
     int a = 0x1;
     a = a | (0x1 << 4);
     printf("%x\n",a);
     return 0;
}
```

In dit geval worden eerst de shift-operator uitgevoerd (dit is ook het geval zonder haakjes maar ter duidelijkheid).

* Dit creert net zoals bij de vorige voorbeelden een bitmask (00010000).  
* Als je de |-operator toepast zal de bit op de 4 positie (van rechts)
    * wijzigen naar 1 als deze 0 is
    * 1 blijven als deze reeds 1 is

|                expressie|   base 10|   base 16|    base 2|
|-------------------------|----------|----------|----------|
|                int a = 1|         1|         1|  00000001|
|                 0x1 << 4|        16|        10|  00010000|
|   a = a &#124;(0x1 << 4)|        17|        11|  00010001|

We maken hier gebruik (in tegenstelling tot lezen van een bit) van een **|**  
Bij deze operator is de **1 dominant**, dus waar een 1 wordt gebruikt bij het masker zal de waarde worden geforceerd naar 1.  
Wanneer er een 0 staat op een specifieke locatie zal deze zich gedragen als een buffer (de originele waarde behouden).  

### Voorbeeld: bits clearen met and (wijzigen naar 0)

Een andere actie die je kan toepassen is een specifieke bit wijzigen naar 0 (ook wel de bit clearen genoemd).
Dit wordt gedaan door een geinverteerd bit-patroon toe te passen zoals hieronder:

```c
#include <stdio.h>

int main()
{
     int a = 0xA;
     a = a & ~(0x1 << 1);
     printf("%x\n",a);
}
```
Dit doet het omgekeerde van voorgaand voorbeeld

* De negatie interveert het patroon 00000010 naar 11111101
* Waar binnen het patroon de bit 1 is zal deze (bij de & operatie)
    * bits die 1 zijn 1 laten
    * bits die 0 zijn 0 laten
* Maar op de positie in het patroon waar de bit 0 is zal deze
    * bits die 0 zijn 0 laten
    * bits die 1 zijn 0 maken

|                expressie|   base 10|   base 16|    base 2|
|-------------------------|----------|----------|----------|
|              int a = 0xa|        10|         A|  00001010|
|                 0x1 << 1|         2|         2|  00000010|
|              ~(0x1 << 1)|       253|        FD|  11111101|
|   a = a & ~(0x1 << 1)   |         8|         8|  00001000|

### Voorbeeld: Bits togglen (of wisselen) met xor

Als laatste voorbeeld (voortgaand op de voorgaande voorbeelden) kan je ook individuele bits laten togglen.  
(togglen = laten alterneren tussen 0 en 1)

Dit kan je eventueel doen met een invertor (~), maar deze gaat alle bits inverteren.  
In dit geval willen we dit toepassen met een bitmask, en daar komt de xor zeer goed van pas.  

Een xor heeft de eigenschap zich te gedragen als een poort die je kan configureren als:

* ofwel een buffer (wanneer je deze als 1 configureert)  
* ofwel een invertor (wanneer je deze als 0 configureert)

Anders gezegd:

* Op de positie waar een bitmask de waarde 1 heeft zal dit het gedrag van een invertor vertonen
  (0 ^ **1** = 1 en 1 ^ **1** = 0)  
  en de bit van het source-getal **inverteren**  
* Op de positie waar een bitmask de waarde 0 heeft zal dit het gedrag van een buffer vertonen
  (0 ^ **0** = 0 en 1 ^ **0** = 1)
  en de bit van het source-getal **niet wijzigen**  

```c
#include <stdio.h>

int main()
{
     int a = 0x2;
     a = a ^ (0x1 << 1);
     printf("%x\n",a);

     a = a ^ (0x1 << 1);
     printf("%x\n",a);

     a = a ^ (0x1 << 1);
     printf("%x\n",a);

     a = a ^ (0x1 << 1);
     printf("%x\n",a);
     return 0;
}
```

Het resultaat van bovenstaande code is als volgt:  

```
$ ./example_of_toggling
0
2
0
2
$
```

De 2de bit van rechts (positie 1) alterneert telkens als we deze expressie uitvoeren.

Dit is namelijk de eigenschap van een xor die we hierboven  hebben beschreven.  
Als je een specifieke bit telkens opnieuw met 1 zal "xor-en" zal deze telkens van waarde wisselen (inverteren) als volgt:

* Je start met een xor tussen 2 maal dezelfde bitwaarde (op positie 1)
```
__0010
^ 0010
__0000
```
Dit levert uiteindelijk een 0 op want beide bits zijn gelijk aan elkaar (en dat levert de waarde 0 op bij xor).  

* De volgende keer echter - als we opnieuw de bit 1 als mask toepassen - zal deze opnieuw 1 worden.
```
__0000
^ 0010
__0010
```
In dit geval verschillen de bits van waarde en dit geeft een 1 als resultaat bij een xor.

* En dit gedrag blijft zich herhalen bij de volgende keer dat we hetzelfde bit-patroon toepassen
```
__0010
^ 0010
__0000
```
```
__0000
^ 0010
__0010
```

> **Nota:**  
> Met de invertor-operator (~) kan je dit enkel op de volledige char (of integer) toepassen (zonder bitmask).

### Besluit: denk in bits

In een klassieke programmeer-cursus worden het werken met bitmasks niet bij de start aangeleerd.  
Voor het programmeren van microcontrollers is dit echter een essentiële vaardigheid.
Dit komt door het principe van "memory mapped io", hetgeen geheugen gaat koppelen aan IO-devices (later meer hierover).  

Dus belangrijk te onthouden:  

* Bitwise operatoren zijn verschillend van hun logische verwanten om dat ze het vergelijk op **bit-level** maken
* Denk bij bitwise operatoren in bits en niet aan de getal-waarde (mind-switch)
* **Dominantie** van 0 of 1
    * Bij **&** (AND) is **0** dominant dus
      * kan je gebruiken om een bit op een positie te **clearen** (en andere bit-posities in masker op 1 zodat die niet wijzigen)
      * te lezen door enkel de bits die je wil lezen op 1 te zetten (en andere bit-posities op 0 zodat die niet rekening worden gebracht
    * Bij **|** (OR) is **1** dominant dus kan je gebruiken om een bit op positie te **setten** (bij 0 behoudt de andere bit de waarde)
* **^ (XOR)** kan je als een **configureerbare** poort laten gedragen
    * als een **buffer** (je configureerbare poort op **0**)
    * als een **inverter** (je configureerbare poort op **1**)
* ^ (XOR) gebruik je in combinatie met een bitmask om te togglen (zoals een inverter maar enkel op specifieke bits)

Deze regels zullen nog veel terugkomen bij het werken met registers in MCU's!!!


### Overzicht

**OVERZICHT:**

* Shift-operators:
     * >>,<<
     * Let op overflow
* Bitwise-operators:
     * inverter: ~
     * bitwise and: &
     * bitwise or: |
     * bitwise xor: ^
* BITMASK
     * == PATROON
     * Laat je toe in bits te denken zonder te rekenen

**Basis-bitmasks:**

```c
1 bit-positie                    => (1 << pos)
1 volledige byte                 => (0xFF << pos)
                                 => (0xFF << (pos * 8))
combineren/plakken van bitmasks  => (1 << pos1) | (1 << pos2)
inverteren van bitmasks          => ~(1 << pos)
                                 => ~0xAA == 0x55
```

**Kenmerken van bitwise-operatoren:**

```c
& => 0 is dominant
| => 1 is dominant
^ => 1 iverter, 0 is buffer
```

**Basis-operaties:**

```c
GET     =>   if( x &  (1 << pos))  
SET     =>   x = x |  (1 << pos)  
CLEAR   =>   x = x & ~(1 << pos)
TOGGLE  =>   x = x ^  (1 << pos)
INVERT  =>   ~0xFF == 0x00
        =>   ~0xAA == 0x55
```

**Andere:**

```c
0xFF == ~0x00
```
