### Een C-programma op command-line bouwen (GCC)

GCC is een command-line-tool die c-code kan omzetten naar een uitvoerbaar bestand

Compilen (van een C-programma) wordt uitgevoerd in 2 stappen:

* **Compileren:**  
  De C-files worden elk omgezet naar een object-file (extensie .o).  
  Hier wordt de C-code reeds vertaald naar machine-taal
* **Linken:**  
  Hier worden 1 of meerdere object files met elkaar verbonden (en eventueel gelinkt aan externe libraries)

We starten met gcc te installeren

### Installatie Linux

Op linux-distributies kan je gcc installeren via de package-managers

**Ubuntu, Mint, Debian:**

~~~
$ sudo apt-get install gcc
~~~

**Fedora, Red Hat:**

~~~
# dnf install gcc
~~~

### Installatie Windows

Voor Windows moet je een Mingw installeren op je machine.   
Er is echter een zip-file voor de cursus voorzien die alle tooling voorziet zonder dat je iets moet installeren (of zelfs administratie-rechten).
We komen hier zo dadelijk op terug.

### Toolchain GCC: Mac

Als je het programma gcc aanroept **via command-line** zal OS X je voorstellen om gcc (of clan) te installeren.  
Laat de installatie gewoon lopen.



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


```{.sh}
$ ls
hello.c
$ gcc -c hello.c
$ ls
hello.c  hello.o
```

**Stap 3: linken**  
Van 1 of meerdere object-files en libraries kan je een uitvoerbaar bestaand (programma) maken door te **linken**.  
Voorlopig werken we met maar 1 source file dus onderstaande command-line volstaat.

```{.sh}
$ gcc hello.o -o hello
```

**Uitvoeren:**  
Daarna kan je het programma uitvoeren door de naam te typen  
(voorafgegaan door ./  om aan te duiden dat het bestand in deze diretory staat, in Windows dit is .\\)

```{.sh}
$ ./hello
!!!Hello World!!!
$
```

> **Bemerking:**  
> In Windows gebruik je voor een uitvoerbaar bestand de extensie .exe, dus het laaste commando is dan ```gcc hello.o -o hello.exe```

### Linken en compilen tegelijk met GCC  

Je kan gcc ook tegelijkertijd laten compileren en linken zodat je direct een uitvoerbaar bestand kijkt:

```{.sh}
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
