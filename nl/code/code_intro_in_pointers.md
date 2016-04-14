## Introductie in pointers

### Voorbeeld: pointers

We hadden reeds gezien dat je - in C - een adres kan opvragen van een variabele (via de &-operator).  
Je kan dit adres opvangen in een pointer-variabele, zoals in het code-voorbeeld hieronder:

```c
#include <stdio.h>

int main(void) {

    unsigned int a = 0x5F010000;
    unsigned int* adres_van_a = &a;

    printf("Waarde van a: %x\n",a );
    printf("Adres van a: %p\n",adres_van_a );
    printf("Waarde van a die : %x\n", *adres_van_a );

    return 0;
}
```

Wat dit programma doet:

* Declareert en initialeert een variabele a op **0x5F010000**
* Vraagt het adres op van deze variabele a via de **&**-operator
* Bewaart het adres in een andere variabele adres_van_a
* Het print de waarde en adres van a af
* Gebruikt echter ook echter de pointer variabele om deze waarde te verkrijgen (en af te drukken)
  hiervoor gebruiken we de dereferentie-operator ```*```

Als resultaat krijgen we:

```
Waarde van a: 5f010000
Adres van a: 0x7ffdcdf795ac
Waarde van a: 5f010000
```

### Referentie en de-referentie

Er zijn hier 3 belangrijke elementen in de code:

**Declaratie van een pointer:**

```c
unsigned int* adres_van_a
```

Het symbool ```*``` wordt hier gebruikt als een deel van het type (geen operator) op aan te duiden dat dit:

* een variabele is van het type **pointer**
* naar een variabele van het type **unsigned int verwijst**


**Referentie nemen van een adres:**  

```c
&a
```

Het symbool ```&``` speelt hier bij initialisatie de rol van **referentie-operator**  
(referentie kan je hier als rechtstreekse vertaling van pointer bekijken)


**De-referentie van een pointer:**  

```{.c }
*adres_van_a
```

Het symbool ```*``` speelt de rol van **de-referentie-operator**
(je gaat als het ware de referentie gebruiken om de geheugenplaats aan te spreken)

### Duiding: pointers

De onderstaande tekening illustreert de code op een andere manier:

![](../../pictures/intro_in_pointers_s.png)

Verklaring:  

* In de tekening hierboven zetten we **variabele a** zich op het **adres 0x00000004**.
* We initialiseren echter een 2de **variabele adres_van_a** die het adres van van a bevat.  
  Deze pointer-variabele bevindt zich op het adres 0x00000001c.  
* Deze pointer-variabele is een variabele zoals een ander specfiek type (pointer-type)
* Een pointer-variabele heeft altijd dezelfde grootte, ongeacht de grootte van het type waarnaar deze "point"  
  Een pointer naar een unsigned char zal dezelfde grootte hebben als een pointer naar het type unsigned long long.  
* Deze grootte komt meestal overeen met de grootte van de adress-bus (probeer dit uit met sizeof uit te voeren op een pointer-variabele of type)   
  Op een 32-bit-platform zal dit 32 bit zijn (x86), op een 64-bit-platform zal dit 64 bit zijn (x86-64)

> **Nota:**  
> We gaan hier uit van de hypotese dat zowel een **unsigned int** als een **pointer** 4 bytes lang zijn voor het voorbeeld.

### Voorbeeld: pointer gebruiken om een waarde te wijzigen:

We breiden het voorgaand voorbeeld om de waarde te wijzigen aan de hand van een pointer aan de hand van de **de-referentie-operator**.

```c
#include <stdio.h>

int main(void) {

    unsigned int a = 0x5F010000;
    unsigned int* adres_van_a = &a;

    printf("Waarde van a: %x\n",a );
    printf("Adres van a: %p\n",adres_van_a );
    printf("Waarde van a (met de-referentie): %x\n",*adres_van_a );

    *adres_van_a = 0x10;

    printf("\n");
    printf("Waarde van a: %x\n",a );
    printf("Adres van a: %p\n",adres_van_a );
    printf("Waarde van a (met de-referentie): %x\n",*adres_van_a );

	return 0;
}
```

### Voorbeeld: pointers en functies

Een pointer - zijnde een variabele als een ander - kan je ook meegegeven aan functies.

```c
#include <stdio.h>

void wijzig_pointer(int* a,int nieuwe_waarde);
void print_pointer(int* a);

int main(void) {

    unsigned int a = 0x5F010000;
    unsigned int* adres_van_a = &a;

    print_pointer(adres_van_a);
    wijzig_pointer(adres_van_a,10);
    print_pointer(adres_van_a);

	return 0;
}

void wijzig_pointer(int* a,int nieuwe_waarde)
{
    *a = nieuwe_waarde;
}

void print_pointer(int* a)
{
    printf("Adres van a: %p\n",a );
    printf("Waarde van a (met de-referentie): %x\n", *a );
}
```

Het "side-effect" hier van is dat je een pointer kan gebruiken om (via dit adres) de waarde van een variabele te wijzigen.

### Voorbeeld: pointers en arrays

```c
#include <stdio.h>

int main(void) {
    unsigned short short_array[3]={1,2,3};
    int teller=0;

    printf("Eerst via een array\n");
    printf("Grootte van short-array van %i elementen is %zu\n",3,(sizeof(short_array)/sizeof(unsigned short)));
    teller=0;
    while(teller<(sizeof(short_array)/sizeof(unsigned short))) {
        printf("Index %i heeft waarde %i \n",teller,short_array[teller]);
        printf("Index %i heeft adres %p \n",teller,&short_array[teller]);
        teller++;
    }


    teller=0;

    printf("Nu met pointer-arithmetiek\n");

    printf("Grootte van short-array van %i elementen is %zu\n",3,(sizeof(short_array)/sizeof(unsigned short)));
    teller=0;
    while(teller<(sizeof(short_array)/sizeof(unsigned short))) {
        printf("Index %i heeft waarde %i \n",teller,*(short_array + teller));
        printf("Index %i heeft adres %p \n",teller,(short_array + teller));
        teller++;
    }

    return 0;
}
```



```bash
Eerst via een array
Grootte van short-array van 3 elementen is 3
Index 0 heeft waarde 1
Index 0 heeft adres 0x7fffb48559e0
Index 1 heeft waarde 2
Index 1 heeft adres 0x7fffb48559e2
Index 2 heeft waarde 3
Index 2 heeft adres 0x7fffb48559e4
Nu met pointer-arithmetiek
Grootte van short-array van 3 elementen is 3
Index 0 heeft waarde 1
Index 0 heeft adres 0x7fffb48559e0
Index 1 heeft waarde 2
Index 1 heeft adres 0x7fffb48559e2
Index 2 heeft waarde 3
Index 2 heeft adres 0x7fffb48559e4
```

### Pointers vs arrays

Pointers en arrays hebben specifieke relatie.  
Je gaat zien - met de volgende voorbeelden - dat ze bijna hetzelfde zijn, maar niet helemaal.  

We starten met te bekijken hoe een array kan worden meegegeven aan een functie...


### Array als argument van een functie

Als je een array meegeeft aan een functie gedraagt hij zich eigenlijk als een pointer.  
Beschouw volgend voorbeeld:

```c
#include <stdio.h>

void print_array(unsigned char a[],int index) {
	printf("%hhu\n",a[1]);
}

int main(void) {
	unsigned char hello[]={1,2,3};
	print_array(hello,1);
	printf("%li\n",sizeof(hello));
	return 0;
}
```

Dit brengt het volgende resultaat:

``` bash
2
3
```
De array print eerst 2 af (index 1), gevolgd door 3 het geen de grootte is van deze array (in bytes)

### Array als argument van een functie, inhoud wijzigen

Idem dito kunnen werkt dit ook voor het schrijven naar het geheugen

```c
#include <stdio.h>

void wijzig_naar_0(unsigned char a[],int index) {
	a[index]=0;
}

void print_array(unsigned char a[],int index) {
	printf("%hhu\n",a[1]);
}

int main(void) {
	unsigned char hello[]={1,2,3};
	wijzig_naar_0(hello,1);
	print_array(hello,1);
	return 0;
}
```

Dit zal niet verassend 0 afdrukken, maar er zit meer achter ...


### Voorbeeld: een array als argument van een functie is een eigenlijk pointer

Wat er echter gebeurt  - als je een array als argument aan een functie meegeeft - is dat niet de data zelf
wordt meegegeven maar een pointer naar deze data.

Door print_array ook nog de grootte van de array afdrukken kunnen we dit al min of meer staven:

```c
#include <stdio.h>

void print_array(unsigned char a[]) {
	printf("Size in print_array: %li\n",sizeof(a));
	printf("%hhu\n",a[1]);
}

int main(void)
{
	unsigned char hello[]={1,2,3};
	print_array(hello);
	printf("Size buiten print_array: %li\n",sizeof(hello));
	return 0;
}
```

We krijgen het volgende resultaat:

```bash
Size in print_array: 8
2
Size buiten print_array: 3
```

* Buiten de functie print deze de grootte af van de array
* Binnen de functie print deze de grootte af van een **pointer**

### Voorbeeld: een array als argument van een functie is een eigenlijk pointer

C is een taal die draait rond performantie:

* Gezien arrays zeer kunnen groot zijn  
 (niets - buiten je processor-architectuur - weerhoud je een array van een 1.000.000 te declareren)
* En de waarde van een variabele telkens wordt gecopieerd  
 (zie ook later wanneer we over stack-geheugen praten)
* Vermijdt C zware operaties door enkel de pointer mee te geven

We kunnen voorgaande code perfect vervangen met een pointer notatie

```c
#include <stdio.h>

void print_array(unsigned char* a) {
	printf("Size in print_array: %li\n",sizeof(a));
	printf("%hhu\n",a[1]);
}

int main(void)
{
	unsigned char hello[]={1,2,3};
	print_array(hello);
	printf("Size buiten print_array: %li\n",sizeof(hello));
	return 0;
}
```

### Duiding: pointers vs arrays

Is een array dan hetzelfde als een pointer?

Nee...

Het verschil tussen beide ligt in het feit dat een array eigenlijk enkel een declaratie is (reservatie) van geheugen.
Na de declaratie kan je de array met de pointer operaties bewerken en uitlezen zoals onderstaand voorbeeld:

```c
#include <stdio.h>

int main(void)
{
	unsigned char hello[3]={};

	hello[1]=5;
	printf("hello[1] ==  %d\n",hello[1]);
	printf("*(hello + 1) ==  %d\n",*(hello + 1));

	*(hello + 2) = 6;
	printf("hello[2] ==  %d\n",hello[2]);
	printf("*(hello + 2) ==  %d\n",*(hello + 2));

	return 0;
}
```

Eigenlijk zoals je ziet is de pointer naar een array gelijkaardig aan de pointer van een gewone variabele van hetzelfde basis-type...

### Opletten: pointers en casten

Verwijzend naar endianess, moet je opletten bij het casten tussen verschillende array (en dus pointer types)
Het gedrag kan daar wel verassend zijn...

```c
#include <stdio.h>

int main(void) {


    unsigned short short_array[3]={0xABCD,0xEF12,0x3456};
    unsigned char* char_array=(unsigned char*)short_array;
    int teller=0;

    printf("Eerst via een array\n\n");
    printf("Grootte van short-array van %i elementen is %zu\n",3,(sizeof(short_array)/sizeof(unsigned short)));
    teller=0;
    while(teller<(sizeof(short_array)/sizeof(unsigned short))) {
        printf("Index %i heeft waarde %x \n",teller,short_array[teller]);
        printf("Index %i heeft adres %p \n",teller,&short_array[teller]);
        teller++;
    }


    teller=0;

    printf("\nNu met pointer-arithmetiek\n\n");

    printf("Grootte van short-array van %i elementen is %zu\n",3,(sizeof(short_array)/sizeof(unsigned char)));
    teller=0;
    while(teller<(sizeof(short_array)/sizeof(unsigned char))) {
        printf("Index %i heeft waarde %x \n",teller,*(char_array + teller));
        printf("Index %i heeft adres %p \n",teller,(char_array + teller));
        teller++;
    }

    return 0;
}
```


```
Eerst via een array

Grootte van short-array van 3 elementen is 3
Index 0 heeft waarde abcd
Index 0 heeft adres 0x7fff6db9ccc0
Index 1 heeft waarde ef12
Index 1 heeft adres 0x7fff6db9ccc2
Index 2 heeft waarde 3456
Index 2 heeft adres 0x7fff6db9ccc4

Nu met pointer-arithmetiek

Grootte van short-array van 3 elementen is 6
Index 0 heeft waarde cd
Index 0 heeft adres 0x7fff6db9ccc0
Index 1 heeft waarde ab
Index 1 heeft adres 0x7fff6db9ccc1
Index 2 heeft waarde 12
Index 2 heeft adres 0x7fff6db9ccc2
Index 3 heeft waarde ef
Index 3 heeft adres 0x7fff6db9ccc3
Index 4 heeft waarde 56
Index 4 heeft adres 0x7fff6db9ccc4
Index 5 heeft waarde 34
Index 5 heeft adres 0x7fff6db9ccc5
```
