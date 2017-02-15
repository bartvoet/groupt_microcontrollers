## Integers introductie

### Wat is een integer in C?

In C zijn er 2 soorten rekenkundige (aritmetic) getallen:

* Integers
* Floating point getallen

Een integer is een geheel getal zoals we deze uit de wiskunde kennen.  

Deze gehele getallen omvatten de natuurlijke getallen, dus de getallen waarmee geteld wordt, en de tegengestelden daarvan, de negatieve gehele getallen.  
Een geheel getal heet 'geheel' omdat het zonder fractionele of decimale componenten kan worden geschreven.

> **Fractionele getallen**, waar we in C de floating-point versie gebruiken zullen **later** in de cursus bekijken.  
> Maar eerst **stap voor stap**...

### Type integer: int

Tot nu toe hebben we het type **int** gebruikt in onze code-voorbeelden, dit type heeft als kenmerken:

* Minimum **2 bytes** in het geheugen volgens C-specificatie
* Meestal echter **4 bytes** op intel-processoren
* **Signed type**, het kan zowel positief als negatief getal voorstellen
* **1 bit**, de MSB (most significant) wordt gebruikt voor het sign (negatief of positief)

### Verschillende types en verschillende groottes

Naast deze **int** heb je ook een aantal andere **types** met verschillende groottes zoals **char, short, long, int, long en long long**.  
Deze variëren allemaal  in lengte (het aantal bytes).

|type         |minimum           | x86               |
|-------------|------------------|-------------------|
| char        | 1                | 1                 |
| short       | 2                | 2                 |
| int         | 2                | 4                 |
| long        | 4                | 4                 |
| long long   | 8                | 8                 |

### Encodering van integers

Je kan dus variabelen aanmaken van verschillende types.  

```c
char a = 10;
short b = 122;
short c = 1855;
```

In het geheugen van een programma hebben worden deze voorgesteld als een opeenvolging van bits.  

~~~
a => 10   => 00001010
b => 122  => 0000000001111010
c => 1855 => 0000011100111111
~~~

Een variabele van het type char (1 byte) zal bijvoorbeeld minder plek in het geheugen innemen als een variabele van het type short (2 bytes).  

Dit heeft als voordeel ervoor dat je programma niet meer plaats gaat innemen dan vereist, hetgeen voor het soort software waarmee men C schrijft geen overbodige luxe is.

### Negatieve waardes

De integer-types die we tot nog toe hebben gezien kunnen zowel negatieve als positieve getallen waardes bevatten.  
Hoe kan een computer deze negatieve waardes encoderen?  
We bekijken 3 mogelijkheden:

* Signed magnitude
* One's complement
* Two's complement

### Signed magnitude

Bij **signed magnitude** gaan we er vanuit dat de MSB als teken bit telt.  
Stel bijvoorbeeld als je een type zou hebben dat maar 3 bits lang is verkrijg je de volgende tabel.

| postief  |   bits   | negatief |   bits   |
|----------|----------|----------|----------|
| 0        |   000    |    0     |   100    |
| 1        |   001    |  - 1     |   101    |
| 2        |   010    |  - 2     |   110    |
| 3        |   011    |  - 3     |   111    |

Bij dit systeem:

* 2 representaties voor 0
* 2^(n-1) positieve mogelijke waardes
* 2^(n-1) negatieve mogelijke waardes

Dit systeem wordt in de praktijk weinig gebruik omdat je moeillijk mee kunt rekenen.  

~~~
    3
+ (-1)
------
  011
+ 001
-----  
  111 ! Waarde klopt niet !
~~~

Als je bijvoorbeeld een positief en een negatief getal wilt optellen krijg je de foutieve uitkomst, dus weg er mee...

### One's complement

One's complement zal daarentegen een negatief getal voorstellen als het complement (inversie) van zijn positieve tegenhanger.

| postief  |   bits   | negatief |   bits   |
|----------|----------|----------|----------|
| 0        |   000    |    0     |   111    |
| 1        |   001    |  - 1     |   110    |
| 2        |   010    |  - 2     |   101    |
| 3        |   011    |  - 3     |   100    |

Bij dit systeem hebben we vergelijkbare eigenschappen:

* 2 representaties voor 0
* 2^(n-1) positieve mogelijke waardes
* 2^(n-1) negatieve mogelijke waardes

Maar hier kan men gemakkelijker met rekenen:

* Getallen optellen
* Bij carry deze opnieuw bijtellen

Beschouw volgend voorbeeld:

~~~
    3
+ (-1)
------
  011
+ 110
-----  
 1001
1 carry dus bij tellen (niet nodig als er geen carry is)
  001
    1
-----
  010 ! Waarde klopt !
~~~

Er is echter een nog efficientere manier om zowel negatieve als positieve getallen te encoderen

### Two's complement

Bij **2's complement** gaat men gelijkaardig te werk als het vorige systeem, maar na het uitvoeren van complement telt men nog het getal 1 bij.  
Dit geeft de volgende tabel.

| postief  |   bits   | negatief |   bits   |
|----------|----------|----------|----------|
| 0        |   000    |  -       |   -      |
| 1        |   001    |  - 1     |   111    |
| 2        |   010    |  - 2     |   110    |
| 3        |   011    |  - 3     |   101    |
| -        |  -       |  - 4     |   100    |

Het verschil tov vorige systemen:

* 1 representatie van 0
* 2^(n-1) positieve mogelijke waardes
* +1 negatieve mogelijke waardes

~~~
    3
+ (-1)
------
  011
+ 111
-----  
 1010
 !carry mag je hier weggooien!
  010 ! Waarde klopt !
~~~

Dit systeem is nog éénvoudiger om met te rekenen en wordt door de meeste computer-systemen gebruikt.  

### Unsigned integers

Later in de cursus komen we nog terug op **signed** integers, maar we nemen eerst echter een andere type onder de loep, namelijk de **unsigned integer**  
Deze unsigned versie verschilt van een signed integer:

* Kan alleen een positieve waarde voorstellen
* Gebruikt geen sign-bit
* De regels rond bit-manipulaties zijn éénvoudiger
  (je moet geen rekening houden met de sign-bit ...)

Je heb bijvoorbeeld het type **unsigned int**.

```c
unsigned int = 5;
```

### Duiding: er zijn verschillende soorten unsigned integers

Net zoals bij de signed versie heb je deze in verschillende groottes.


|type                  |minimum           | x86               |
|----------------------|------------------|-------------------|
| unsigned char        | 1                | 1                 |
| unsigned short       | 2                | 2                 |
| unsigned int         | 2                | 4                 |
| unsigned long        | 4                | 4                 |
| unsigned long long   | 8                | 8                 |

> **Bemerking**  
> De bedoeling/**focus** van dit hoofdstuk is te leren werken met **bit**-operators.
> Daarom willen we ons **beperken** (in dit hoofdstuk) tot **unsigned integers**, deze zijn naamlijker eenvoudiger van opbouw en meer relevant voor een eerste kennismakig met bit-operatoren en expressies.

Voor de rest van dit hoofdstuk gaan we voort met deze **unsigned integers**  
De bedoeling/**focus** van dit hoofdstuk is te leren werken met **bit**-operators.
Daarom willen we ons **beperken** (in dit hoofdstuk) tot **unsigned integers**, deze zijn naamlijker eenvoudiger van opbouw en meer relevant voor een eerste kennismakig met bit-operatoren en expressies.

### Duiding: bit-representatie

De byte-encoding van een unsigned char is vrij éénvoudig vergeleken met de signed varianten.
Bijvoorbeeld hieronder de representatie van:

* unsigned short 0xAAAA (16 bits/2 bytes lang)
* unsigned char 0xAA (8 bits/1 byte lang)

|type  | hex      |15  | 14 | 13 | 12 | 11 | 10 |  9 |  8 |  7 |  6 |  5 |  4 |  3 |  2 |  1 |  0 |
|------|----------|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
|short |0xAAAA    | 1  | 0  | 1  | 0  | 1  | 0  | 1  | 0  |  1 | 0  | 1  | 0  |  1 | 0  | 1  | 0  |
|char  |0xAA      | -  | -  | -  | -  | -  | -  | -  | -  |  1 | 0  | 1  | 0  |  1 | 0  | 1  | 0  |

We hoeven hier geen rekening te houden met de sign-bits.

> **Bemerking:**
> We houden in dit hoofdstuk nog geen rekening met de endianess (big vs little endian)
> Hier komen we in deel 2 van deze cursus nog op terug als we bij type-conversies aankomen.

### HEX-representatie (base 16)

Als we de onderliggende representatie (of encoding) gaan gebruiken - op bit-niveau -  is het handig getallen uit te drukken als hexadecimale getallan.

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

### Voorbeeld: een waarde uitdrukken als hex in c-code

Een unsigned char (maar ook andere integer-variante) kan hexadecimaal gerepresenteerd worden door "0x" te laten volgen door een hexadecimaal getal.

Bijvoorbeeld ```int a = 0xA``` zal er voor zorgen dat integer a wordt geinitiaseerd met de waarde 10 (decimaal) of A (hexadecimaal)

Onderstaande code zal desgevolg ook 10 afdrukke (%i is de decimale representatie).

```c
#include <stdio.h>

int main()
{
    int value_ten = 0xa;
    printf("%i\n",value_ten);
    return 0;
}
```

### Voorbeeld: het is enkel een representatie

Onderstaande code toont ook aan dat de hex-representatie dezelfde waarde geeft als  de decimale representatie...

```c
#include <stdio.h>

int main()
{
    if(10 == 0xa) {
       printf("10 == 0xa");
    }
}
```

### Voorbeeld: printf in hex-formaat

De printf-functie geeft je ook de mogelijkheid om de waarde als hexadecimaal getal af te drukken.

Dit kan je gebruiken door de placeholder x te gebruiken (ipv i die we tot nog toe hebben gebruikt)

```c
#include <stdio.h>

int main()
{
  int value_ten = 10;
  printf("%i == %x\n",value_ten,value_ten);
  return 0;
}
```

### Intermezzo: sizeof-operator

Vandaag beperken we ons in de meeste oefeningen en labo's tot de "unsigned char" (1 byte) en "unsigned short" (2 bytes) om op een eenvoudige manier een introductie te geven naar het werken met bit-operatoren.

In c heb je trouwens een **operator** (geen functie) met de naam sizeof die toelaat van de **grootte** van een bepaald **type** te verkrijgen.

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

> **Bemerking:**
> De size_of geeft het type size_t terug, daarom gebruiken we de placeholder
> %zu.  We komen hier later nog op terug.

Als je dit programma uitvoert krijg je volgend resultaat

```c
sizeof(unsigned char) = 1 bytes
sizeof(an_unsigned_char) = 1 bytes
sizeof(unsigned short) = 2 bytes
sizeof(an_unsigned_short) = 2 bytes
sizeof(unsigned int) = 4 bytes
sizeof(unsigned long) = 8 bytes
sizeof(unsigned long long) = 8 bytes
```
