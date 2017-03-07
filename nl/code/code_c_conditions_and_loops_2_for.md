

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

### Duiding: for-loop

We starten met de for-loop.  
Dit is een loop gelijkaardig aan de while-loop (deze zal code herhalen zolang een expressie niet 0 evalueert), maar bevat 3 (2 extra) onderdelen:

* **Initialisatie:**  
  Enkelvoudige statement(s) die worden uitgevoerd **voor het starten van loop**
  Let wel, enkel statements, geen declaraties en ook geen complexe statements!!
* **Test:**  
  Hier komt dezelfde test-expressie zoals we deze in een while loop plaatsen.
  Expressie gevalueerd voor **elke maal** dat we door deze loop lopen
* **Update:**  
  Statment uitgevoerd **na elke herhaling**

Zo'n **for-loop** zal de volgende vorm hebben

```c
for(<initialisatie>;<test>;<update>) {
  <body>
}
```
### Duiding: gebruik van for-loop

Wanneer gebruik je for loops?
Eénvoudig, vanaf het moment dat

* Je een variabele moet initialiseren voor het starten van deze loop
* Deze moet testen voor het uitvoeren
* Deze moet updaten na elke uitvoering

In praktijk gaan we zien dat dit vooral veel voorkomt bij het bijhouden van **tellers**

### Voorbeeld: for-loop als teller

Als eerste voorbeeld gebruiken we dan ook een teller-voorbeeld:

* We tellen tot 10
* Printen op elke lijn
* Eénmaal bij 10 tellen we terug naar beneden

```c
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

Als we dit nu implementeren met een while-loop zien we dat we eigenlijk lijnen code besparen.

```c
int main()
{
    int i=0;
    while(i<10) {
        printf("%i",i);
        i++;
    }

    i = 0;
    while(i>=0) {
        printf("%i",i);
        i--;
    }

    return 0;
}

```

### Voorbeeld: geneste for-loops

Je bent vrij te kiezen welk naam je gebruikt als teller.

In de praktijk wordt echter veel de variabele-naam **i** gebruikt.
Als je dan een geneste loop zou hebben zou het niveau daaronder de volgende letter van het alfabet worden gebruikt...

Stel het volgende:

* Je wilt een aan tal rijen en kolommen vullen
* Elke combinatie van deze rij-kolom moet het patroon kolom-rij worden afgedrukt
* Elke rij start op een nieuwe regel

Dit kan bijvoorbeeld met een geneste for-loop worden geïmplementeerd:


```c
int main()
{
   int i,j;

   for(i=0;i<10;i++) {
     for(j=0;i<10;i++) {
        printf("%i-%i ",i,j);
     }
   }
   return 0;
}
```

Dit geeft als resultaat:

```
0-0 0-1 0-2 0-3 0-4 0-5 0-6 0-7 0-8 0-9
1-0 1-1 1-2 1-3 1-4 1-5 1-6 1-7 1-8 1-9
2-0 2-1 2-2 2-3 2-4 2-5 2-6 2-7 2-8 2-9
3-0 3-1 3-2 3-3 3-4 3-5 3-6 3-7 3-8 3-9
4-0 4-1 4-2 4-3 4-4 4-5 4-6 4-7 4-8 4-9
5-0 5-1 5-2 5-3 5-4 5-5 5-6 5-7 5-8 5-9
6-0 6-1 6-2 6-3 6-4 6-5 6-6 6-7 6-8 6-9
7-0 7-1 7-2 7-3 7-4 7-5 7-6 7-7 7-8 7-9
8-0 8-1 8-2 8-3 8-4 8-5 8-6 8-7 8-8 8-9
9-0 9-1 9-2 9-3 9-4 9-5 9-6 9-7 9-8 9-9
```

### Voorbeeld: meerdere statements

In het het initialisatie- en update-segment kan je meerdere (enkelvoudige) statements uitvoeren.
Deze kan je dan scheiden via de ,-operator

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
Met het volgende resultaat

```
0-0 1-2 2-4 3-6 4-8
```
