## Een C-programma op command-line compileren (GCC)

Nu de tools zijn geinstalleerd kunnen we starten met ons eerste programma te compilen.  
We kunnen hier verder werken met de C file die we hebben gebruikt tijdens het "command-line"-hoofdstuk.  

> De code wordt in het volgende hoofdstuk verder verklaard

### Je eerste programma compilen

**Stap 1: code schrijven**  
Je schrijft je code naar een bestand en geeft dit een naam met de extensie C.  

```c
#include <stdio.h>

int main()
{
	printf("!!!Hello World!!!");
    return 0;
}
```

**Stap 2: compileren**  
Je **compileert** deze C-code naar een object-file (extensie .o).  

Deze **object-file** is niet het uiteindelijk uitvoerbaar bestand, maar eerder een tussenbestand dat je toelaat van meerdere C-files in bouwen (build) van een programma.  

Een object-file bevat reeds de machine instructies van je programma, maar moet in de volgende stap nog gelinkt worden aan libraries (en eventueel andere objects).  
Binnen een paar lessen komen we hier nog uitgebreider op terug als we grotere programma's maken.


```bash
$ ls
hello.c
$ gcc -c hello.c
$ ls
hello.c  hello.o
```

**Stap 3: linken**  
Van 1 of meerdere object-files en libraries kan je een uitvoerbaar bestaand (programma) maken door te **linken**.  
Voorlopig werken we met maar 1 source file dus onderstaande command-line volstaat.

```bash
$ gcc hello.o -o hello
```

**Uitvoeren:**  
Daarna kan je het programma uitvoeren door de naam te typen  
(voorafgegaan door ./  om aan te duiden dat het bestand in deze diretory staat, in Windows dit is .\\)

```bash
$ ./hello
!!!Hello World!!!
$
```

> **Bemerking:**  
> In Windows gebruik je voor een uitvoerbaar bestand de extensie .exe, dus het laaste commando is dan ```gcc hello.o -o hello.exe```

### Linken en compilen tegelijk met GCC  

Je kan gcc ook tegelijkertijd laten compileren en linken zodat je direct een uitvoerbaar bestand kijkt:

```bash
$ ls
hello.c
$ gcc hello.c -o hello
$ ls
hello.c  hello
$ ./hello
!!!Hello World!!!
$
```

Dit is een veréénvoudigde manier die we de eerstvolgende lessen gaan gebruiken.  
Het vorige voorbeeld is echter belangrijk om te beseffen dat achter het bouwen van een C-programmen hierachter verschillende processen zitten zoals:

* Compilen
* Linken
* Preprocessing
* ...

We gaan in de volgende hoofdstukken deze verschillende bouwstenen/processen verder uitleggen en verdiepen.
