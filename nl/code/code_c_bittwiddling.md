## Bit-wise operaties en integer (deel 1)

Eerder hadden in deze cursus hebben we integer (int) gezien als datatype.
We hebben deze gebruikt voor  

* Mathematische expressies (en operators) zoals +, *, -, / en %
* Logische expressies en operators zoals &&, || en !
* Relationele expressies en operatoren zoals >,<, ...

Wat deze operatoren algemaal gemeen hebben is dat op de waarde van het getal werken.  
Zoals we direct gaan zien bestaan er ook operatoren om integers te manipuleren op bit-niveau.  

Dit is een vaardigheid die we nog veel gaan nodig hebben bij het werken met microcontrollers (of ander low level-programmeer-activiteiten).  
Alvorens echter deze operaties en expressies te bespreken gaan we eerst kijken hoe een integer er uit ziet.  

### Unsigned integer-types

Tot nu toe hebben we het type **int** gebruikt in onze code-voorbeelden, dit heeft als ken merken:

* Signed type, het kan zowel positief als negatief getal voorstellen
* Minimum 2 bytes volgens C-specificatie
* Meestal echter 4 bytes op intel-processoren
* 1 bit wordt gebruikt voor het sign (negatief of positief)

Naast deze integer heb je ook een aantal andere **signed types** met verschillende groottes zoals **char, short, long, int, long en long long**.

We nemen deze later nog onder de loep gezien (interne opbouw, conversies, ...)  
Bedoeling hier is te leren werken met bit-operators dus beperken we ons tot unsigned integer-types.  
Deze zijn eenvoudiger van opbouw en meer relevant voor een eerste kennismakig met bit-operatoren en expressies..  

Net zoals het type int dat we eerder gebruikt hebben in vorige hoofdstukken hebben we ook een type **unsigned int**.

Alvorens deze te bekijken gaan we kijken naar de **unsigned** varianten.   

|type                  |minimum           | x86               | 
|----------------------|------------------|-------------------|
| unsigned char        | 1                | 1                 |
| unsigned short       | 2                | 2                 |
| unsigned int         | 2                | 4                 |
| unsigned long        | 4                | 4                 |
| unsigned long long   | 8                | 8                 |

De byte-encoding van een unsigned char is vrij éénvoudig vergeleken met de signed varianten (die we volgende les bekijken).  

We beperken ons in deze les tot de unsigned char:

* Stelt een byte voor
* Heeft geen sign-bit  
* Start met de MSB
* Eindigt met de LSB
* Elke waarde stelt een macht van 2 voor
* Dus de range van waardes is (0-255)

|positie     |7   |6   |5   |4   |3   |2    |1    |0    |
|------------|----|----|----|----|----|-----|-----|-----|
|macht 2     |128 |64  |32  |16  |8   |4    |2    |1    |
|AA (170)    |1   |0   |1   |0   |1   |0    |1    |0    |


Vanuit de bitwise operatoren de we zo direct gaan zien kan je het volgende als model nemen voor een unsigned char

### HEX-representatie

Als we de onderliggende representatie (of encoding) gaan gebruiken - op bit-niveau -  is het handig getallen uit te drukken als hexadecimale getallan.

|base 10  |base 16 | base 2 |
|---------|--------|--------|
|0        |0       |00000000|
|1        |1       |00000001|
|2        |2       |00000010|
|3        |3       |00000011|
|4        |4       |00000100|
|5        |5       |00000101|
|6        |6       |00000110|
|7        |7       |00000111|
|8        |8       |00001000|
|9        |9       |00001001|
|10       |a       |00001010|
|11       |b       |00001011|
|12       |c       |00001100|
|13       |d       |00001101|
|14       |e       |00001110|
|15       |f       |00001111|

Een unsigned char (maar ook andere integer-variante) kan hexadecimaal gerepresenteerd worden door "0x" te laten volgen door een hexadecimaal getal.   

Bijvoorbeeld ```int a = 0xA``` zal er voor zorgen dat integer a wordt geinitiaseerd met de waarde 10 (decimaal) of A (hexadecimaal)

Onderstaande code zal desgevolg ook 10 afdrukken.

```{.c}
#include <stdio.h>

void main() 
{
	int value_ten = 0xa;
    printf("%i\n",value_ten);
}
```

Onderstaande code toont ook aan dat de hex-representatie de zelfde waarde geeft als  de decimale representatie...

```{.c}
#include <stdio.h>

void main() 
{
	if(10 == 0xa) {}
		printf("10 == 0xa");
    }
}
```

### Voorbeeld: printf in hex-formaat

De printf-functie geeft je ook de mogelijkheid om de waarde als hexadecimaal getal af te drukken.  

Dit kan je gebruiken door de placeholder x te gebruiken (ipv i die we tot nog toe hebben gebruikt)

```{.c} 
#include <stdio.h>

void main() 
{
	int value_ten = 10;
    printf("%i == %x\n",value_ten,value_ten);
}
```

### Voorbeeld: sizeof-operator

Vandaag beperken we ons tot de "unsigned char" om op een eenvoudige manier een introductie te geven naar het werken met bit-operatoren.  

Als je echter wil weten hoe groot andere 

In c heb je trouwens een operator (geen functie) met de naam sizeof die toelaat van de grootte van een bepaald type te verkrijgen.  

```{.c}
#include <stdio.h>

int main(void)
{
	printf("sizeof(unsigned char) = %i bytes\n", (int) sizeof(unsigned char));
	printf("sizeof(unsigned short) = %i bytes\n", (int) sizeof(unsigned short));
	printf("sizeof(unsigned int) = %i bytes\n", (int) sizeof(unsigned int));
	printf("sizeof(unsigned long) = %i bytes\n", (int) sizeof(unsigned long));
	printf("sizeof(unsigned long long) = %i bytes\n", (int) sizeof(unsigned long long));
    return 0;
}
```

```
$ ./size_of_signed_ints
sizeof(unsigned char) = 1 bytes
sizeof(unsigned short) = 2 bytes
sizeof(unsigned int) = 4 bytes
sizeof(unsigned long) = 8 bytes
sizeof(unsigned long long) = 8 bytes
$
```

### Bitwise operatoren in c

#### Bitwise operatoren vs logische operatoren

Tot nog toe hebben we logische operatoren gezien zoals &&, || en !, deze hadden als eigenschappen:

* Een integer-operand met waarde 0 wordt beschouwd als een **logische 0**
* Elke integer-operand met een waarde <> 0 wordt beschouwd als een **logische 1**
* Je krijgt een logische uitkomst, dus enkel 0 of 1 als uitkomst

De operatoren die we vandaag bekijken noemen we bitwise operatoren.  
Met bit-wise willen we zeggen dat deze op bit-niveau opereren, ipv de operanden als 0 en 1 te gaan beschouwen gaan deze operator elke bit mat elkaar kan vergelijken.

#### Voorbeeld: verschil tussen logische en bitwise operatoren

We kunnen dit best met een stukje code gaan vergelijken

```{.c}
#include <stdio.h>
void main()
{
	printf("2 && 2 = %i\n",2 && 2);
	printf("2 & 2 = %i\n", 2 & 2);	
}
```
Als je dit uitvoert krijg je de volgende output

```
$ gcc twoandtwo.c -o twoandtwo
$ ./twoandtwo
2 && 2 = 1
2 & 2 = 2 

```

Bij de eerste statement (&&) gaat men enkel kijken of de integer <> is van 0.  
Zo ja wordt deze als een 1 bekeken.  

Het resultaat van een logische AND toe te passen is heeft dan ook het getal 1 als resultaat.  

|**&&**                 |**2**|**1**|**0**|
|-----------------------|-----|-----|-----|
|**2 wordt 1**          |0    |0    |1    |
|**2 wordt 1**          |0    |0    |1    | 
|**2 && 2 == 1 && 1 = **|0    |0    |1    |

Bij de bitwise operator gaat deze de bits individueel met elkaar gaan matchen en krijgen we het getal 2 als resultaat

|**&**          |**2**|**1**|**0**|
|---------------|-----|-----|-----|
|**2 blijft 2** |0    |1    |0    |
|**2 blijft 2** |0    |1    |0    | 
|**2 & 2**      |0    |1    |0    |

#### Voorbeeld: verschil tussen logische en bitwise operatoren (2)

Nog een ander voorbeeld is de combinatie 5 en 2.  
Hier is het verschil tussen beide nog opvallender (1 en 0),.

```{.c}
#include <stdio.h>
void main()
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

#### Overzicht bitwise operatoren  

Naast & heb je hier een overzicht van all bitwise operatoren:

| Operator | Betekenis             | Voorbeeld    | Resultaat (per bit-positie)                       |ç
|----------|-----------------------|--------------|---------------------------------------------------|
| &        | AND                   | x & y        | 1 als beide 1 zijn                                |
| &#124;   | OR                    | x &#124; y   | 1 als er 1 van de 2 een 1 voorkomt                |
| ^        | XOR                   | x ^ y        | 1 als enkel 1 operator 1 bevat                    |
| ~        | NOT                   | ~x           | 1 als x 0 is                                      |

> Binaire getallen worden vanaf hier bits genoemd (binary digits)  
> Als we in deze tekst bits vergelijken, vergelijken we bits op de zelfde positie bij 2 integers

#### Voorbeeld: Bitwise operator & 

& (and) zal:  
* in 0 resulteren als 1 van beide bits gelijk zijn aan 0  
* in 1 als beide bits 1 zij

zoals in onderstaand waarheidstabel

| A | B | S  |
|:--|:--|:---|
| 0 | 0 | 0  |
| 0 | 1 | 0  |
| 1 | 0 | 0  |
| 1 | 1 | 1  |

Toegepast op een concreet voorbeeld zie je dat enkel de binaire digits (

| &         |7|6|5|4|3|2|1|0|
|-----------|-|-|-|-|-|-|-|-|
|**5B**     |0|1|0|1|1|0|1|1|
|**CA**     |1|1|0|0|1|0|1|0|
|**4A**     |0|1|0|0|1|0|1|0|

Code:

```{.c}
#include <stdio.h>
void main()
{
	printf("0x5B & 0xCA = %x\n", 0x5B & 0xCA);	
}
```
Als je dit uitvoert krijg je de volgende output

```
$ gcc example_bit_and.c -o example_bit_and
$ ./example_bit_and
0x5B & 0xCA = 4a
$ 
```

#### Voorbeeld: Bitwise operator |

| (or) zal in 1 resulteren als minstens 1 van opereranden gelijk is aan 1 volgens de waarheidstabel.

| A | B | S  |
|:--|:--|:---|
| 0 | 0 | 0  |
| 0 | 1 | 1  |
| 1 | 0 | 1  |
| 1 | 1 | 1  |

Voorbeeld:

| &#124    |0|1|2|3|4|5|6|7|
|----------|-|-|-|-|-|-|-|-|
|**5B**    |0|1|0|1|1|0|1|1|
|**CA**    |1|1|0|0|1|0|1|0|
| **DB**   |1|1|0|1|1|0|1|1|

Code:

```{.c}
#include <stdio.h>
void main()
{
	printf("0x5B | 0xCA = %x\n", 0x5B | 0xCA);	
}
```
Als je dit uitvoert krijg je de volgende output

```
$ gcc example_bit_or.c -o example_bit_or
$ ./example_bit_or
0x5B | 0xCA = db
$ 
```

#### Bitwise operator ^

^ (xor) zal in 1 resulteren als 1 van beide operanden 1, anders zal de uitslag altijd 0 zijn

| A | B | S  |
|:--|---|:---|
| 0 | 0 | 0  |
| 0 | 1 | 1  |
| 1 | 0 | 1  |
| 1 | 1 | 0  |

Zoals je zien in de laatste rij resulteren de kolommen waar beide bits gelijk zijn in een 0.

| ^        |0|1|2|3|4|5|6|7|
|----------|-|-|-|-|-|-|-|-|
|**5B**    |0|1|0|1|1|0|1|1|
|**CA**    |1|1|0|0|1|0|1|0|
|**DB**    |1|0|0|1|0|0|0|1|

Hetzelfde voorbeeld in code bevestigd de tabel:  

```{.c}
#include <stdio.h>
void main()
{
	printf("0x5B ^ 0xCA = %x\n", 0x5B ^ 0xCA);	
}
```

Als je dit uitvoert krijg je de volgende output

```
$ gcc example_bit_xor.c -o example_bit_xor
$ ./example_bit_xor
0x5B ^ 0xCA = db
$ 
```

### Bit-shifting

Een 2de soort van bit-operatoren zijn de bit-shift-operatoren

| Operator | Betekenis             | Voorbeeld    | Resultaat (per bit-positie)                                        |
|----------|-----------------------|--------------|--------------------------------------------------------------------|
| <<       | shift links           | x << y       | Elke bit van x wordt y posities naar links (richting MSB) geduwd   |
| >>       | shift rechts          | x >> y       | Elke bit van x wordt y posities naar rechts (richting LSB geduwd   |

Belangrijke kenmerken van deze operatoren (logical shift):

* De bits die aan de rand van je getal zitten verdwijnen (worden bijna letterlijk weggeduwd)   
    * 00000101 >> 1 zal resulteren in 00000010, de LSB ben je kwijt  
    * 10100000 << 1 zal resulteren in 01000000, de RSB ben je kwijt
* De nieuwe bits die worden ingeschoven zijn 0  

> Dit gedrag is trouwens niet 100 % overeenkomstig bij signed getallen waar een arithmatische shift wordt uitgevoerd.  
> Hier komen we later in de cursus nog op terug.   

#### Voorbeeld <<

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|       0xa << 0|        10|         a|  00001010|
|       0xa << 1|        20|        14|  00010100|
|       0xa << 3|        80|        50|  01010000|
|       0xa << 4|       160|        a0|  10100000|

> Bemerking: de getallen worden in dit geval ook vermenigvuldigd met 2

```{.c}
#include <stdio.h>
void main()
{
    printf("%x\n,0xa << 0);	
    printf("%x\n,0xa << 1);	
    printf("%x\n,0xa << 3);	
    printf("%x\n,0xa << 4);	
}
```


#### Voorbeeld >>

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|      0xa0 >> 0|       160|        a0|  10100000|
|      0xa0 >> 1|        80|        50|  01010000|
|      0xa0 >> 3|        20|        14|  00010100|
|      0xa0 >> 4|        10|         a|  00001010|

> Bemerking: de getallen worden in dit geval ook gedeeld door 2

```{.c}
#include <stdio.h>
void main()
{
    printf("%x\n,0xa >> 0);	
    printf("%x\n,0xa >> 1);	
    printf("%x\n,0xa >> 3);	
    printf("%x\n,0xa >> 4);	
}
```
#### Voorbeeld: >> wegshiften van bits

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|      0x0a >> 0|        10|         a|  00001010|
|      0x0a >> 1|         5|         5|  00000101|
|      0x0a >> 3|         1|         1|  00000001|
|      0x0a >> 4|         0|         0|  00000000|

#### Voorbeeld: << wegshiften van bits

|      expressie|   base 10|   base 16|    base 2|
|---------------|----------|----------|----------|
|      0xa0 << 0|       160|        a0|  10100000|
|      0xa0 << 1|        64|        40|  01000000|
|      0xa0 << 3|         0|         0|  00000000|
|      0xa0 << 4|         0|         0|  00000000|

#### Voorbeeld

```{.c}
#include <stdio.h>

void main()
{
	
}


```


### Toepassingen

#### Bits lezen

Je will weten of een specifieke bit is geactiveerd?
Dit kan je doen door 2 operatoren te combineren & en <<

* Met ```1 << x``` kan je een bit-patroon maken dat enkel een 1 bevat op positie x
* Als je dit patroon toepast, in de onderste table (1 << 3 == 00000100) met een | zal die volgende operatie toepassen

|                         |0|1|2|3|4|5|6|7|
|-------------------------|-|-|-|-|-|-|-|-|
| test_getal = 5          |0|0|0|0|0|1|0|1|
| 1 << 3                  |0|0|0|0|0|1|0|0|
| 5 &#124; (1 << 3)       |0|0|0|0|0|1|0|0|

```{.c}
#include <stdio.h>

void main()
{
    int test_getal= 0x5;

    if(test_getal & (1 << 2)) {
        printf("bit %i van testgetal %x is gezet\n",2,test_getal);
    } else {
        printf("bit %i van testgetal %x is niet gezet\n",2,test_getal);
    }

    if(test_getal & (1 << 1)) {
        printf("bit %i van testgetal %x is gezet\n",1,test_getal);
    } else {
        printf("bit %i van testgetal %x is niet gezet\n",1,test_getal);
    }
}
```

### Voorbeeld: Bitmask

Wat we hier eigenlijk toepasten is wat we noemen een bitmask.  
Je maakt een bit-patroon aan waarmee je een stuk uit een integer selecteerd.

Als voorbeeld, stel het volgende:

* Een unsigned short heeft 16 bits
* Je wil deze opsplitsen in 2 chars

```{.c}
#include <stdio.h>

void main()
{
#include <stdio.h>

void main()
{
   unsigned short big_number = 0xAABB;
   unsigned char ls_byte = big_number & 0x00ff;
   unsigned char ms_byte = (big_number & 0xff00) >> 8;

   printf("ms byte of number %x is %x\n",big_number,ms_byte);
   printf("ls byte of number %x is %x\n",big_number,ls_byte);
}
```
Bovenstaande code combineert in dit geval de 2 bit- en shift-operatoren:

* Voor de ls_byte is dit vrij eenvoudig:  
```
  0000000011111111  00ff
& 1010101010111011  aabb
  0000000010111011  00bb 
```
* Voor de ms_byte zijn er 2 stappen nodig:  
```
  1111111100000000  ff00
& 1010101010111011  aabb
  1010101000000000  aa00
>> 8
  0000000010101010  00aa
```

#### Voorbeeld: printen welk bits zijn gezet

```{.c}
#include <stdio.h>

void main()
{
	 int test_getal;
     int i=0;

     printf("Geef een getal in: ");
     scanf("%i",&test_getal);

     while(i<8) {
         if(test_getal & 1 << i) {
            printf("bit %i van testgetal %x is gezet\n",i,test_getal);
         }
    i++;
    }
}
```

#### Bits wijzigen naar 1 (met or)

Tot nu toe hadden we enkel geprobeerd een waardes te weten te kokmen.  
Je kan ook een bit in een getal wijzigen, dit is een vaardigheid dat je zeer veel nodig zal hebben voor een MCU-programma.  

```{.c}
#include <stdio.h>

void main()
{
	 int a = 0x1;
     a = a | (0x1 << 4);
     printf("%x\n",a); 
}
```
In dit geval worden eerst de shift-operator uit gevoerd (dit is ook het geval zonder haakjes maar ter duidelijkheid).   

* Dit creert net zoals bij de vorige voorbeelden een bitmask (00001000).  
* Als je de |-operator toepast zal de bit op de 4 positie (van rechts)
    * wijzigen naar 1 als deze 0 is
    * 1 blijven als deze reeds 1 is

|                expressie|   base 10|   base 16|    base 2|
|-------------------------|----------|----------|----------|
|                int a = 1|         1|         1|  00000001|
|                 0x1 << 4|        16|        10|  00001000|
|   a = a &#124;  0x1 << 4|        17|        11|  00001001|


#### Bits wijzigen naar 0 (met and)

Een andere actie die je kan toepassen is een specifieke bit wijzigen naar 0 (ook wel de bit clearen genoemd).
Dit wordt gedaan door een geinverteerd bit-patroon toe te passen zoals hieronder:

```
#include <stdio.h>

void main()
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
|              ~(0x1 << 1)|        13|         d|  11111101|
|   a = a & ~(0x1 << 1)   |         8|         8|  00001000|



#### Bits wisselen (met xor)

Als laatste voorbeeld (voortgaand op de voorgaande voorbeelden) kan je ook individuele bits laten togglen.  
(togglen = laten alterneren tussen 0 en 1)   

```
#include <stdio.h>

void main()
{
	 int a = 0xA;
     a = a ^ (0x1 << 1);
     printf("%x\n",a);

     a = a ^ (0x1 << 1);
     printf("%x\n",a);

     a = a ^ (0x1 << 1);
     printf("%x\n",a);

     a = a ^ (0x1 << 1);
     printf("%x\n",a);
}
```

Het resultaat van bovenstaande code is vergelijkbaar met het vorige voorbeeld.  

```
$ ./example_of_toggling
8
a
8
a
$
```

De 2de bit van rechts alterneert telkens als we deze expressie uitvoeren.
