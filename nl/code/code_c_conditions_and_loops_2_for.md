

## Loops en condities: for-loop

We hebben eerder condities en loops (herhalingen gezien):

* **Logische** en **relationele** operatoren (&&,||,==, ...)
* **if-statements**
  Evalueren van een expressie (als verschillend van 0)
  Op die basis een stuk code uitvoeren
* if- , else- , else if **clausules**
* **while-loop-statements**
  Herhalen zolang een expressie waar is (waar if maar 1 maal uitvoert)
* **Nesten** van deze **samengestelde** statements

In dit 2de deel bekijken de-forloops:

* **for**-loop

### Voorbeeld: for-loop

Hoe ziet zo'n for-loop er uit?

```c
#include <stdio.h>

int main()
{
  int i;
  for(i=0;i<5;i++) {
    printf("%i\n",i);
  }
}
```

olgend voorbeeld zal de getallen 0 tem 4 afdrukken.

```
$ ./basic_loop_example
0
1
2
3
4
$
```

### Anatomie van een for-loop

```c
for(<initialisatie>;<test>;<update>) {
  <body>
}
```

Deze loop zal net zoals een while-loop blijven loopen zolang een bepaalde conditie voldaan is (i<5) maar heeft wat extra opties/onderdelen:

* **Initialisatie:**  
  Enkelvoudige statement(s) die worden uitgevoerd **voor het starten van loop**
  Let wel, enkel statements, geen declaraties en ook geen complexe statements!!
* **Test:**  
  Hier komt dezelfde test-expressie zoals we deze in een while loop plaatsen.
  Expressie gevalueerd **voor elke keer** dat we door deze loop lopen
* **Update:**  
  Statement uitgevoerd **na elke herhaling**

### Duiding: gebruik van for-loop

Een loop gebruik je dus als:

* Je een variabele moet initialiseren voor het starten van deze loop
* Deze moet testen voor het uitvoeren
* Deze moet updaten na elke uitvoering

In praktijk gaan we zien dat dit vooral veel voorkomt bij het bijhouden van **tellers**

### Voorbeeld: for-loop als teller

Een **ander voorbeeld** van een teller:

* We **tellen** tot 10
* **Printen** op elke lijn
* Eénmaal bij 10 tellen we **terug naar beneden**

```c
#include <stdio.h>

int main()
{
    int i=0;
    for(i=0;i<10;i++) {
        printf("%i\n",i);
    }

    for(i=10;i>=0;i--) {
        printf("%i\n",i);
    }

    return 0;
}
```

### Voorbeeld: while-loop als teller

Als we dit voorbeeld nu implementeren met een while-loop, zien we dat we eigenlijk lijnen code besparen.

```c
#include <stdio.h>

int main()
{
    int i=0;
    while(i<10) {
        printf("%i",i);
        i++;
    }

    i = 10;
    while(i>=0) {
        printf("%i",i);
        i--;
    }

    return 0;
}

```

### Voorbeeld: geneste for-loops

Je bent vrij te kiezen welk naam je gebruikt als teller.  
In de praktijk wordt echter veel de variabele-naam **i** gebruikt (verwijst naar iteratie).

Als je nu een geneste loop zou hebben zou het niveau daaronder de volgende letter van het alfabet worden gebruikt (j,k,l...)

Stel dat we de maaltafels willen afdrukken, dit kan bijvoorbeeld met een geneste for-loop worden geïmplementeerd:


```c
#include <stdio.h>

int main()
{
   int i,j;

   for(i=1;i<10;i++) {
     for(j=1;j<10;j++) {
        printf("%i*%i=%i ",i,j,(i*j));
     }
     printf("\n");
   }
   return 0;
}
```

* De buitenste loop zal het basis-getal opleveren
* De binnenste loop zal het binnen-getal opleveren

Dit levert uiteindelijk als resultaat:

```
1*1=1 1*2=2 1*3=3 1*4=4 1*5=5 1*6=6 1*7=7 1*8=8 1*9=9
2*1=2 2*2=4 2*3=6 2*4=8 2*5=10 2*6=12 2*7=14 2*8=16 2*9=18
3*1=3 3*2=6 3*3=9 3*4=12 3*5=15 3*6=18 3*7=21 3*8=24 3*9=27
4*1=4 4*2=8 4*3=12 4*4=16 4*5=20 4*6=24 4*7=28 4*8=32 4*9=36
5*1=5 5*2=10 5*3=15 5*4=20 5*5=25 5*6=30 5*7=35 5*8=40 5*9=45
6*1=6 6*2=12 6*3=18 6*4=24 6*5=30 6*6=36 6*7=42 6*8=48 6*9=54
7*1=7 7*2=14 7*3=21 7*4=28 7*5=35 7*6=42 7*7=49 7*8=56 7*9=63
8*1=8 8*2=16 8*3=24 8*4=32 8*5=40 8*6=48 8*7=56 8*8=64 8*9=72
9*1=9 9*2=18 9*3=27 9*4=36 9*5=45 9*6=54 9*7=63 9*8=72 9*9=81
```

Stel dat je enkel geinteresseerd bent in de maaltafels vanaf 5, dan wijzig je de test-conditie als volgt:

```c
#include <stdio.h>

int main()
{
   int i,j;

   for(i=5;i<10;i++) {
     for(j=1;j<10;j++) {
        printf("%i*%i=%i ",i,j,(i*j));
     }
     printf("\n");
   }
   return 0;
}
```

Met als resultaat:

```
5*1=5 5*2=10 5*3=15 5*4=20 5*5=25 5*6=30 5*7=35 5*8=40 5*9=45
6*1=6 6*2=12 6*3=18 6*4=24 6*5=30 6*6=36 6*7=42 6*8=48 6*9=54
7*1=7 7*2=14 7*3=21 7*4=28 7*5=35 7*6=42 7*7=49 7*8=56 7*9=63
8*1=8 8*2=16 8*3=24 8*4=32 8*5=40 8*6=48 8*7=56 8*8=64 8*9=72
9*1=9 9*2=18 9*3=27 9*4=36 9*5=45 9*6=54 9*7=63 9*8=72 9*9=81
```

### Voorbeeld: meerdere statements

In het het initialisatie- en update-segment kan je meerdere (enkelvoudige) statements uitvoeren.
Deze kan je dan scheiden door een comma:

Dit kan dan bijvoorbeeld worden gebruikt als je meerdere tellers wil bijhouden in 1 loop zoals in het volgende voorbeeld:

```c
#include <stdio.h>

int main()
{
   int i,j;

   for(i=0,j=0;i<5;i++,j+=2) {
        printf("%i-%i ",i,j);
   }
   return 0;
}
```

Met het volgende resultaat:

```
0-0 1-2 2-4 3-6 4-8
```

Deze optie geldt wel enkel voor het eerste (initialisatie) en tweede deel (update) gedeelte (test moet zowiezo een enkele expressie blijven).

> Notal: In de praktijk wordt dit niet heef veel gebruikt, maar in bepaalde gevallen kan dit toch nuttig zijn.
