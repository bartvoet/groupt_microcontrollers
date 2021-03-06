# Bit-wise operaties en integer (deel 1)

----

## Tot nog toe...

* **Mathematische** expressies (en operators)
  +, *, -, / en %
* **Logische** expressies en operators
  &&, || en !
* **Relationele** expressies en operatoren
  >,<, ...

------

## Tot nog toe...

Gemeenschappelijk!!

* Werken met numerieke waarde
* Werken met een getal in zijn geheel
* (Decimaal of binair)

------

## Vandaag...

* Bitwise Operatoren
* Bit-shifting
* Bit-masking

------

## Vandaag...

* Manipulatie van integers
* Op bit-niveau
* **Vaardigheid** nodig bij het werken met **microcontrollers**

------

### Integer-types

Tot nu toe hebben we het type **int** gebruikt:

* **Signed type**, het kan zowel positief als negatief getal voorstellen
* Minimum **2 bytes** in het geheugen (volgens C-specificatie)
* Meestal echter **4 bytes** op intel-processoren
* **1 bit**, de MSB (most significant) wordt gebruikt voor het sign (negatief of positief)

------

### Unsigned integers

* Kan negatieve waarde voorstellen
* Gebruikt geen sign-bit
* De regels rond bit-manipulaties zijn éénvoudiger
  (je moet geen rekening houden met de sign-bit ...)

-------

### Focus

* Leren werken met **bit**-operators.
* **beperken** (in dit hoofdstuk) tot **unsigned integers**
* eenvoudiger van opbouw en meer relevant voor een eerste kennismakig met bit-operatoren en expressies.

-------

### Duiding: er zijn verschillende soorten unsigned integers

|type                  |minimum           | x86               |
|----------------------|------------------|-------------------|
| unsigned char        | 1                | 1                 |
| unsigned short       | 2                | 2                 |
| unsigned int         | 2                | 4                 |
| unsigned long        | 4                | 4                 |
| unsigned long long   | 8                | 8                 |

### Duiding: bit-representatie

* unsigned short 0xAAAA (16 bits/2 bytes lang)
* unsigned char 0xAA (8 bits/1 byte lang)

|type  | hex      |15  | 14 | 13 | 12 | 11 | 10 |  9 |  8 |  7 |  6 |  5 |  4 |  3 |  2 |  1 |  0 |
|------|----------|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|short |0x1010    | 1  | 0  | 1  | 0  | 1  | 0  | 1  | 0  |  1 | 0  | 1  | 0  |  1 | 0  | 1  | 0  |
|char  |0x10      | -  | -  | -  | -  | -  | -  | -  | -  |  1 | 0  | 1  | 0  |  1 | 0  | 1  | 0  |

-------

### Herhaling: HEX-representatie (base 16)

|base 10  |base 16 | base 2 |
|---------|--------|--------|
|0        |0       |    0000|
|1        |1       |    0001|
|2        |2       |    0010|
|3        |3       |    0011|
|4        |4       |    0100|
|5        |5       |    0101|
|6        |6       |    0110|
|7        |7       |    0111|
|8        |8       |    1000|
|9        |9       |    1001|
|10       |a       |    1010|
|11       |b       |    1011|
|12       |c       |    1100|
|13       |d       |    1101|
|14       |e       |    1110|
|15       |f       |    1111|

-------

### Voorbeeld: een waarde uitdrukken als hex in c-code

```c
#include <stdio.h>

int main()
{
    int value_ten = 0xa;
    printf("%i\n",value_ten);
    return 0;
}
```

-------

### Voorbeeld: het is enkel een representatie


```c
#include <stdio.h>

int main()
{
    if(10 == 0xa) {
       printf("10 == 0xa");
    }
}
```

-------

### Voorbeeld: printf in hex-formaat

```c
#include <stdio.h>

int main()
{
  int value_ten = 10;
  printf("%i == %x\n",value_ten,value_ten);
  return 0;
}
```

-------

### Intermezzo: sizeof-operator


```c
#include <stdio.h>

int main(int)
{

	unsigned char an_unsigned_char = 5;
	printf("sizeof(unsigned char) = %zu bytes\n",  sizeof(unsigned char));
	printf("sizeof(an_unsigned_char) = %zu bytes\n",  sizeof(an_unsigned_char));

	unsigned short an_unsigned_short = 5;
	printf("sizeof(unsigned short) = %zu bytes\n",  sizeof(unsigned short));
	printf("sizeof(an_unsigned_short) = %zu bytes\n",  sizeof(an_unsigned_short));

	printf("sizeof(unsigned int) = %zu bytes\n",  sizeof(unsigned int));

	printf("sizeof(unsigned long) = %zu bytes\n", sizeof(unsigned long));

	printf("sizeof(unsigned long long) = %zu bytes\n", sizeof(unsigned long long));
	return 0;
}
```

-------

### Intermezzo: sizeof-operator

> **Bemerking:**
> De size_of geeft het type size_t terug, daarom gebruiken we de placeholder
> %zu.  We komen hier later nog op terug.

-------

### Intermezzo: sizeof-operator

Als je dit programma uitvoert krijg je volgend resultaat

```
sizeof(unsigned char) = 1 bytes
sizeof(an_unsigned_char) = 1 bytes
sizeof(unsigned short) = 2 bytes
sizeof(an_unsigned_short) = 2 bytes
sizeof(unsigned int) = 4 bytes
sizeof(unsigned long) = 8 bytes
sizeof(unsigned long long) = 8 bytes
```

-------

### Duiding: Bitwise operatoren vs logische operatoren

Tot nog toe hebben we **logische operatoren** gezien zoals **&&, || en !**,
deze hadden als eigenschappen:

* Een integer-operand met waarde 0 wordt beschouwd als een **logische 0**
* Elke integer-operand met een waarde <> 0 wordt beschouwd als een **logische 1**
* Je krijgt een logische uitkomst, dus enkel 0 of 1 als uitkomst

-------

### Duiding: Bitwise operatoren vs logische operatoren

De operatoren die we vandaag bekijken noemen we **bitwise operatoren**.
Met bitwise willen we zeggen dat deze op bit-niveau opereren.

-------

### Duiding: Bitwise operatoren vs logische operatoren

Bitwise operatoren werken echter op een andere manier:

* **Elke bit** van elke operand (getal of variabele) wordt individueel bekeken
* Elke bit (of **positie**) van de ene operand wordt vergeleken met de bit (positie) van de andere operand

-------

### Voorbeeld: verschil tussen logische en bitwise operatoren

```c
#include <stdio.h>
int main()
{
	printf("2 && 2 = %i\n",2 && 2);
	printf("2 & 2 = %i\n", 2 & 2);
  return 0;
}
```
-------

### Voorbeeld: verschil tussen logische en bitwise operatoren

```
$ gcc twoandtwo.c -o twoandtwo
$ ./twoandtwo
2 && 2 = 1
2 & 2 = 2

```
-------

### Voorbeeld: verschil tussen logische en bitwise operatoren

Bij de eerste statement (&&) gaat men enkel kijken of de integer <> is van 0.
Zo ja wordt deze als een 1 bekeken.

Het resultaat van een logische AND toe te passen op deze getallen heeft dan ook het getal 1 als resultaat.

|**&&**                 |**2**|**1**|**0**|
|-----------------------|-----|-----|-----|
|**2 wordt 1**          |0    |0    |1    |
|**2 wordt 1**          |0    |0    |1    |
|**2 && 2 == 1 && 1 = **|0    |0    |1    |

-------

### Voorbeeld: verschil tussen logische en bitwise operatoren

Bij de bitwise operator gaat deze de bits individueel met elkaar gaan matchen en krijgen we het getal 2 als resultaat

|**&**          |**2**|**1**|**0**|
|---------------|-----|-----|-----|
|**2 blijft 2** |0    |1    |0    |
|**2 blijft 2** |0    |1    |0    |
|**2 & 2**      |0    |1    |0    |

-------

### Voorbeeld: verschil tussen logische en bitwise operatoren (2)

Nog een ander voorbeeld is de combinatie 5 en 2.
Hier is het verschil tussen beide nog opvallender (1 en 0),.

```c
#include <stdio.h>
int main()
{
	printf("5 && 2 = %i\n",5 && 2);
	printf("5 & 2 = %i\n", 5 & 2);
}
```
Als je dit uitvoert krijg je de volgende output:

```
$ gcc twoandtwo.c -o twoandtwo
$ ./twoandtwo
5 && 2 = 1
5 & 2 = 0
```
Bij de logische operator krijgen we opnieuwe 1 als resultaat:

|**&&** |**2**|**1**|**0**|
|-------|-----|-----|-----|
|**5**  |0    |0    |1    |
|**2**  |0    |0    |1    |
|**1**  |0    |0    |1    |

Bij de bitwise worden de individuele bits vergeleken.
Gezien er op elke positie bij beide getallen minstens één 0 voorkomt is het resultaat van deze combinatie ook 0.

|**&**  |**2**|**1**|**0**|
|-------|-----|-----|-----|
|**5**  |1    |0    |1    |
|**2**  |0    |1    |0    |
|**2**  |0    |0    |0    |

> Dit kan gevaarlijk zijn als je dit in een if-conditie of loop zou gebruiken (& ipv &&)

### Overzicht: bitwise operatoren

Naast & heb je hier een overzicht van all bitwise operatoren:

| Operator | Betekenis             | Voorbeeld    | Resultaat (per bit-positie)                       |
|----------|-----------------------|--------------|---------------------------------------------------|
| &        | AND                   | x & y        | 1 enkel en alleen als beide 1 zijn                 |
| &#124;   | OR                    | x &#124; y   | 1 als er 1 van de 2 bits 1 is                     |
| ^        | XOR                   | x ^ y        | 1 als enkel 1 operatand 1 is                      |
| ~        | NOT                   | ~x           | 1 als x 0 is anders 0                             |


> **Nota:**
> Binaire getallen worden vanaf hier bits genoemd (binary digits)
> Als we in deze tekst bits vergelijken, vergelijken we bits op de zelfde positie bij 2 integers

### Voorbeeld: Bitwise operator & (and)

& (and) zal:
* in 0 resulteren als 1 van beide bits gelijk zijn aan 0
* in 1 als beide bits 1 zijn

zoals in onderstaand waarheidstabel

| A | B | S  |
|:--|:--|:---|
| 0 | 0 | 0  |
| 0 | 1 | 0  |
| 1 | 0 | 0  |
| 1 | 1 | 1  |

Toegepast op een concreet voorbeeld zie je dat enkel de binaire digits (of posities) waar bij beide getallen/operanden
een 1 voorkomt een 1 als uitkomst hebben (anders 0).

| &         | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|-----------|---|---|---|---|---|---|---|---|
|**5B**     | 0 | 1 | 0 | 1 | 1 | 0 | 1 | 1 |
|**CA**     | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |
|**4A**     | 0 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |

Code:

```c
#include <stdio.h>
int main()
{
	printf("0x5B & 0xCA = %x\n", 0x5B & 0xCA);
  return 0;
}
```
Als je dit uitvoert krijg je de volgende output

```
$ gcc example_bit_and.c -o example_bit_and
$ ./example_bit_and
0x5B & 0xCA = 4a
$
```

### Voorbeeld: Bitwise operator | (or)

| (or) zal in 1 resulteren als minstens 1 van opereranden gelijk is aan 1 volgens de waarheidstabel.

| A | B | S  |
|:--|:--|:---|
| 0 | 0 | 0  |
| 0 | 1 | 1  |
| 1 | 0 | 1  |
| 1 | 1 | 1  |

Voorbeeld:

| &#124;   | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|----------|---|---|---|---|---|---|---|---|
|**5B**    | 0 | 1 | 0 | 1 | 1 | 0 | 1 | 1 |
|**CA**    | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |
|**DB**    | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 1 |

Code:

```c
#include <stdio.h>
int main()
{
	printf("0x5B | 0xCA = 0x%x\n", 0x5B | 0xCA);
}
```
Als je dit uitvoert krijg je de volgende output

```
$ gcc example_bit_or.c -o example_bit_or
$ ./example_bit_or
0x5B | 0xCA = 0xdb
$
```

### Voorbeeld: Bitwise operator ^ (xor)

^ (xor) zal in 1 resulteren als 1 van beide operanden 1, anders zal de uitslag altijd 0 zijn

| A | B | S  |
|:--|---|:---|
| 0 | 0 | 0  |
| 0 | 1 | 1  |
| 1 | 0 | 1  |
| 1 | 1 | 0  |

Zoals je zien in de laatste rij resulteren de kolommen waar beide bits gelijk zijn in een 0.

| ^        | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|----------|---|---|---|---|---|---|---|---|
|**5B**    | 0 | 1 | 0 | 1 | 1 | 0 | 1 | 1 |
|**CA**    | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 0 |
|**91**    | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 1 |

Hetzelfde voorbeeld in code bevestigd de tabel:

```c
#include <stdio.h>
int main()
{
	printf("0x5B ^ 0xCA = 0x%x\n", 0x5B ^ 0xCA);
  return 0;
}
```

Als je dit uitvoert krijg je de volgende output

```bash
$ gcc example_bit_xor.c -o example_bit_xor
$ ./example_bit_xor
0x5B ^ 0xCA = 0x91
$
```

### Voorbeeld: Bitwise operator ~ (invertor)

De laatste bitwise operator die we zien is de invertor.
Dit is een unitaire operator (slechts 1 operand).

```c
#include <stdio.h>
int main()
{
	printf("~0xAA = %x\n", 0x55);
  return 0;
}
```

Deze operator zal dus de waarde gaan om van elke individuele bit

|          | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
|----------|---|---|---|---|---|---|---|---|
|**0xAA**  | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
|**~0xAA** | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 |

> **Nota:**
> Bij de laatste voorbeelden gaan we zien dat we de xor kunnen gebruiken voor individuele bits te inverteren

### Duiding: Bit-shifting

Een 2de soort van bit-operatoren zijn de bit-shift-operatoren

| Operator | Betekenis             | Voorbeeld    | Resultaat (per bit-positie)                                        |
|----------|-----------------------|--------------|--------------------------------------------------------------------|
| <<       | shift links           | x << y       | Elke bit van x wordt y posities naar links (richting MSB) geduwd   |
| >>       | shift rechts          | x >> y       | Elke bit van x wordt y posities naar rechts (richting LSB geduwd   |

Belangrijke kenmerken van deze operatoren (logical shift):

* De **bits** die aan de rand van je getal zitten **verdwijnen** (worden bijna letterlijk **weggeduwd**)
    * 00000101 >> 1 zal resulteren in 00000010, de LSB ben je kwijt
    * 10100000 << 1 zal resulteren in 01000000, de MSB ben je kwijt
* De nieuwe bits die worden **ingeschoven** zijn 0

> **Nota:**
> Dit gedrag is trouwens niet 100 % overeenkomstig bij **signed** getallen waar een arithmatische shift wordt uitgevoerd.
> Hier komen we later in de cursus nog op terug.

### Voorbeeld <<

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|       0xa << 0|        10|         a|  00001010|
|       0xa << 1|        20|        14|  00010100|
|       0xa << 3|        80|        50|  01010000|
|       0xa << 4|       160|        a0|  10100000|

> Bemerking: de getallen worden in dit geval ook vermenigvuldigd met 2

```c
#include <stdio.h>
int main()
{
    printf("%x\n",0xa << 0);
    printf("%x\n",0xa << 1);
    printf("%x\n",0xa << 3);
    printf("%x\n",0xa << 4);
}
```


### Voorbeeld >>

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|      0xa0 >> 0|       160|        a0|  10100000|
|      0xa0 >> 1|        80|        50|  01010000|
|      0xa0 >> 3|        20|        14|  00010100|
|      0xa0 >> 4|        10|         a|  00001010|

> Bemerking: de getallen worden in dit geval ook gedeeld door 2

```c
#include <stdio.h>
int main()
{
    printf("%x\n",0xa >> 0);
    printf("%x\n",0xa >> 1);
    printf("%x\n",0xa >> 3);
    printf("%x\n",0xa >> 4);
    return 0;
}
```
### Voorbeeld: >> wegshiften van bits

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|      0x0a >> 0|        10|         a|  00001010|
|      0x0a >> 1|         5|         5|  00000101|
|      0x0a >> 3|         1|         1|  00000001|
|      0x0a >> 4|         0|         0|  00000000|

### Voorbeeld: << wegshiften van bits

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|      0xa0 << 0|       160|        a0|  10100000|
|      0xa0 << 1|        64|        40|  01000000|
|      0xa0 << 3|         0|         0|  00000000|
|      0xa0 << 4|         0|         0|  00000000|


### Duiding: Toepassing met bitmasks

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

```bash
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
